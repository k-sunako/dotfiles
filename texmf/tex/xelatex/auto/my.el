(TeX-add-style-hook
 "my"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape -interaction nonstopmode --synctex=1")
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("zxjafont" "ipa")))
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
    "zxjatype"
    "zxjafont"
    "xltxtra")
   (TeX-add-symbols
    '("xleftleftarrows" ["argument"] 1)
    '("xrightrightarrows" ["argument"] 1)
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
    "break")
   (LaTeX-add-tcolorbox-lib-theorems-newtcbtheorems
    "defn"
    "theo"
    "lemm"
    "clai"
    "coro"
    "exam"
    "algo"
    "rema"))
 :latex)

