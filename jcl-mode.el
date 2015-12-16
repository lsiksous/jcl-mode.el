;;; jcl-mode.el --- IBM JCL Major Mode               -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Laurent Siksous

;; Author: Laurent Siksous <lss@MacBookAir.local>
;; Keywords: JCL

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(defvar jcl-mode-hook nil)

(defvar jcl-mode-map
  (let ((map (make-keymap)))
;;    (define-key map "\C-j" 'newline-and-indent)
    map)

  "Keymap for JCL major mode.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.jcl\\'" . jcl-mode))

;;; 
(defconst jcl-keywords '("JOB" "EXEC" "DD")  )
(defconst jcl-keywords-regexp (regexp-opt jcl-keywords 'words))

(defvar jcl-font-lock-keywords
  `(
    (,jcl-keywords-regexp . font-lock-keyword-face)
   ))

(defvar font-lock-defaults '((jcl-font-lock-keywords)))

(defvar jcl-mode-syntax-table
  (let ((st (make-syntax-table)))
;;    (modify-syntax-entry ?/ ". 12" st)
     st)
  "Syntax table for jcl-mode.")

(defun jcl-mode ()
  "Major mode for editing JCL files."
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table jcl-mode-syntax-table)
  (setq-local comment-start "//*")
  (use-local-map jcl-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(jcl-font-lock-keywords))
  (setq major-mode 'jcl-mode)
  (setq mode-name "JCL")
  (run-hooks 'jcl-mode-hook))

(provide 'jcl-mode)

;;; jcl-mode.el ends here
