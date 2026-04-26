;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "my"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape -interaction nonstopmode --synctex=1")
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("tcolorbox" "") ("amsmath" "") ("amsthm" "") ("mathrsfs" "") ("amssymb" "") ("xifthen" "") ("xstring" "") ("physics" "") ("tikz" "") ("tikz-cd" "") ("minted" "") ("luatex85" "") ("luatexja-fontspec" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimWrite")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbEnv")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "Verb*")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "EscVerb")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "EscVerb*")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb*")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (TeX-run-style-hooks
    "tcolorbox"
    "amsmath"
    "amsthm"
    "mathrsfs"
    "amssymb"
    "xifthen"
    "xstring"
    "physics"
    "tikz"
    "tikz-cd"
    "minted"
    "luatex85"
    "luatexja-fontspec")
   (TeX-add-symbols
    '("xleftleftarrows" ["argument"] 1)
    '("xrightrightarrows" ["argument"] 1)
    "dom"
    "cod"
    "sign"
    "relrelbarsep"
    "relrelbar"
    "rightrightarrowsfill"
    "leftleftarrowsfill")
   (LaTeX-add-tcolorbox-tcbuselibraries
    "theorems")
   (LaTeX-add-amsthm-newtheorems
    "thm"
    "theorem"
    "proposition"
    "claim"
    "lemma"
    "definition")
   (LaTeX-add-amsthm-newtheoremstyles
    "break"))
 :latex)

