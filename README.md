# Plantilla LaTeX de TFG de la Universidad Carlos III de Madrid (IEEE)
Por Luis Daniel Casais Mezquida

> [!WARNING]
> Esta plantilla funcionó para lo que quería hacer, pero no tengo intención de seguir manteniéndola.
> 
> Recomiendo _encarecidamente_ usar [Typst](https://typst.app/) en lugar de LaTeX, por su facilidad de uso y velocidad de compilación.
>
> Puedes encontrar una versión mejorada de esta plantilla, en versión Typst, en [guluc3m/uc3m-thesis-ieee-typst](https://github.com/guluc3m/uc3m-thesis-ieee-typst/).


## Uso
La memoria consiste de un archivo principal [`report.tex`](report.tex), y un archivo de definición de clase [`uc3mthesisIEEE.cls`](uc3mthesisIEEE.cls), el cual contiene toda la configuración.

El archivo [`report.tex`](report.tex) actual es una simple plantilla para usar la clase `uc3mthesisIEEE`. Ésta clase está basada en la clase `report` de LaTeX, con tamaño de letra 12.


### Configuración
- Puedes configurar el idioma de la memoria al incluir la clase. Esto afectará a algunas cosas como el nombre del índice.
    ```latex
    \documentclass[es]{uc3mthesisIEEE}  % español
    ```
    ```latex
    \documentclass[en]{uc3mthesisIEEE}  % inglés
    ```
- También puedes configurar la (sub)carpeta para las imágenes, y así al usar una imagen no es necesario especificar este nombre.
    ```latex
    \graphicspath{{img/}}
    ```
> [!NOTE]
> Ten en cuenta que la portada requiere de imágenes que serán buscadas en la raíz de esta carpeta

- La portada y otros elementos dependen de la configuración de los "distintos atributos":
    - `\author`: Autor.
    - `\degree`: Grado que se cursa, e.g. `Grado en Ingeniería Informática`
    - `\date`: Fecha de entrega, e.g. `Junio 2024`.
    - `\title`: Título del TFG.
    - `\advisors`: Tutor (es). Si se añade más de uno, añade `\\` entre nombres.  
    - `\shorttitle`: Formato corto del título que poner en el _header_ en lugar del título.  
    Puede ser omitido.



<!--
### Estilos de página
La clase cuenta con dos estilos de página definidos:
- `fancy`: En páginas impares, capítulo y página en el encabezado, en las impares, título del trabajo (o `\shorttitle` si está definido). El número de página varía de lugar dependiendo de si es página par o impar.
- `noheader`: Sin encabezado y con el número de página centrado abajo. Usado en cualquier lugar fuera de la parte de la tesis, y en la primera página de cada capítulo.
-->



### Macros
La clase también cuenta con ciertas macros predefinidas:
- `\makecover`: Genera la portada con los atributos anteriormente definidos.
    - Puedes usar `\makecover[old]` para usar el logo antiguo (y objetivamente superior) de la UC3M.
- `\makeepigraph{quote}{author}{source}`: Genera la página del epígrafe. `source` es opcional y puede dejarse en blanco.
- `\keywords{keywords}`: _Wrapper_ para colocar correctamente las palabras clave de la tesis en el entorno `abstract`. Es recomendable usar el formato `Foo \sep bar`.
- `\newglossaryentrywithacronym{acronym/name}{long name}{description}`: Genera una entrada en el glosario con su acrónimo correspondiente.


### Entornos
La clase también cuenta con un entorno predefinido:
- `\begin{abstract} \end{abstract}`: Empieza el entorno de la tesis, con números arábicos.
- `\begin{acknowledgements} \end{acknowledgements}`: Empieza el entorno de los agradecimientos.
- `\begin{thesis} \end{thesis}`: Empieza el entorno de la tesis, con números arábicos.
- `\begin{appendices} \end{appendices}`: Empieza el entorno de los apéndices, los cuales no están numerados.




## Compilación
Primero debes instalar LaTeX.

- Para Linux, instala [TeX Live](https://www.tug.org/texlive/):
    - [APT](https://wiki.debian.org/AptCLI) ([Debian](https://www.debian.org/)/[Ubuntu](https://ubuntu.com/)): [`texlive-full`](https://packages.debian.org/search?keywords=texlive-full&searchon=names&suite=stable&section=all)
    - [DNF](https://dnf.readthedocs.io/en/latest/) ([Fedora](https://fedoraproject.org/)): [`texlive-scheme-full`](https://packages.fedoraproject.org/pkgs/texlive/texlive-scheme-full/)
    - [AUR](https://aur.archlinux.org/) ([Arch](https://archlinux.org/)): [`texlive-full`](https://aur.archlinux.org/packages/texlive-full)
- Para Windows, instala [MiKTeX](https://miktex.org/download#win), asegúrate de añadirlo al `PATH`, e instala [Strawberry Perl](https://strawberryperl.com/).  
    Con [winget](https://github.com/microsoft/winget-cli):
    ```powershell
    winget install MiKTeX.MiKTeX StrawberryPerl.StrawberryPerl
    ```
  Una vez instalado MiKTeX, ábrelo, ve a `Updates` y actualiza todos los paquetes.

- Para MacOS, instala [MacTeX](https://www.tug.org/mactex/mactex-download.html).  
    Con [brew](https://brew.sh):
    ```
    brew install --cask mactex
    ```

> [!IMPORTANT]
> Como vamos a usar imágenes SVG, necesitas instalar [Inkscape](https://inkscape.org/).
> 
> Si estás en Windows, asegúrate de añadir el ejecutable al `PATH` (suele estar en `C:\Program Files\Inkscape\bin\`).


Para compilar la memoria, usa:
```
latexmk -cd -shell-escape -pdf report.tex
```

Para compilar el glosario es necesario (después de compilar la primera vez), usar el comando:
```
makeglossaries report
```

Y luego volver a compilar.


> [!TIP]
> Opcionalmente, puedes especificar el directorio de salida con el parámetro `-outdir`, e.g. `-outdir=build`
> 
> Si te encuentras con problemas al compilar, asegúrate de que existen todas las subcarpetas (e.g. `build/parts/`).


## Extensiones VS Code
### [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
_Suite_ para LaTeX, con _syntax highlighting_, completado, visor de PDFs, compilación automática al guardar...

> [!IMPORTANT]
> Si estás usando esta extensión, recuerda añadir el parámetro `-shell-escape` (ver [LaTeX Workshop FAQ](https://github.com/James-Yu/LaTeX-Workshop/wiki/FAQ#how-to-pass--shell-escape-to-latexmk))

> [!TIP]
> Puedes cambiar el directorio de salida en `latex-workshop.latex.outDir`, poniéndolo por ejemplo a `%DIR%/build` (ver [LaTeX Workshop Wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki/View#latex-workshoplatexoutdir)).  
> Si te encuentras con problemas al compilar, asegúrate de que existen todas las subcarpetas (e.g. `build/parts/`).

> [!TIP]
> Puedes habilitar el conteo de palabras estableciendo `latex-workshop.wordcount` a `onSave` en los ajustes. Más información [aquí](https://github.com/James-Yu/LaTeX-Workshop/wiki/ExtraFeatures#counting-words).

### [LTeX+](https://marketplace.visualstudio.com/items?itemName=ltex-plus.vscode-ltex-plus)
Corrector ortográfico para LaTeX y MarkDown.

> [!TIP]
> Puedes cambiar el idioma del corrector a través del parámetro `ltex.language` en la [configuración de VS Code](https://code.visualstudio.com/docs/editor/settings#_settings-json-file)


## Ejemplos
Aquí te dejamos algunos ejemplos de memorias hechas con esta plantilla:
- [L. D. Casais – Analysis, Design and Implementation of a Didactic and Generic Assembly Language Simulator](https://github.com/ldcas-uc3m/TFG/tree/main/report) (2024)
- [J. Lázaro – Development of a Symbolic Calculator from Scratch](https://github.com/JorgeyGari/sym_tfg/tree/main/report) (2024)
- [A. Guerrero - Desarrollo de un Compilador Genérico de Lenguaje Ensamblador para el Simulador CREATOR](https://github.com/ALVAROPING1/TFG) (2025)
- [C. López - Desarrollo de instrucciones vectoriales RISC-V para el simulador CREATOR](https://github.com/CLopMan/creator/tree/master/report) (2025)
- [A. Fernández - Herramienta didáctica para la programación concurrente](https://github.com/Adri-Extremix/Trabajo-de-Fin-de-Grado/tree/main/doc) (2025)
- [E. Alarcón - Evaluating performance and energy impact of programming languages](https://github.com/Astrak00/tfg-report) (2025)

> [!NOTE]
> Si usas esta plantilla, por favor abre un [_issue_](https://github.com/ldcas-uc3m/thesis-template/issues) o crea una [_pull request_](https://github.com/ldcas-uc3m/thesis-template/pulls) añadiendo tu repositorio a la lista.


## Más información
- [Guía de estilo de la biblioteca de la UC3M para el TFG](https://uc3m.libguides.com/TFG/escribir)
- [Transparencias de la presentación "Memorias de TFG en LaTeX"](https://github.com/rajayonin/latex-thesis) (2025)
- [How to LaTeX?](https://github.com/guluc3m/report-template/blob/main/README.md#how-to-latex), en [guluc3m/report-template](https://github.com/guluc3m/report-template)
- [Plantilla de TFG de la biblioteca de la UC3M](https://www.overleaf.com/latex/templates/bachelor-thesis-template-uc3m-ieee-style/rtmtnzvxjnwt)
- [L. Prieto - Plantilla TFG UC3M LaTeX](https://github.com/lpgonzalez/uc3m_tfg_latex_template_en)
