(TeX-add-style-hook
 "my"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape -interaction nonstopmode --synctex=1")
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
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

