(TeX-add-style-hook
 "org-ex-koma-jarticle"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape -interaction nonstopmode --synctex=1")
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("scrlayer-scrpage" "footsepline=0.25pt" "automark") ("biblatex" "style=reading")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "amsmath"
    "amssymb"
    "mathrsfs"
    "hyperref"
    "fixltx2e"
    "graphicx"
    "longtable"
    "float"
    "wrapfig"
    "soul"
    "xcolor"
    "minted"
    "scrlayer-scrpage"
    "biblatex")
   (LaTeX-add-bibliographies
    "~/myspace/Bibliography/references"))
 :latex)

