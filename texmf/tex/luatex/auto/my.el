;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "my"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape -interaction nonstopmode --synctex=1")
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("tcolorbox" "") ("amsmath" "") ("amsthm" "") ("mathrsfs" "") ("amssymb" "") ("xifthen" "") ("xstring" "") ("physics" "") ("tikz" "") ("tikz-cd" "") ("luatex85" "") ("luatexja-fontspec" "") ("minted" "")))
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
    "luatex85"
    "luatexja-fontspec"
    "minted")
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

