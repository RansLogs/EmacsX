;;; x-lisp.el --- Emacs Prelude: Configuration common to all lisp modes.


;;; Commentary:

;; Configuration shared between all modes related to lisp-like languages.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'x-programming)
(x-require-packages '(rainbow-delimiters))

;; Lisp configuration
(define-key read-expression-map (kbd "TAB") 'completion-at-point)

;; wrap keybindings
(define-key lisp-mode-shared-map (kbd "M-(") (x-wrap-with "("))
;; FIXME: Pick terminal-friendly binding.
(define-key lisp-mode-shared-map (kbd "M-\"") (x-wrap-with "\""))

;; a great lisp coding hook
(defun x-lisp-coding-defaults ()
  (smartparens-strict-mode +1)
  (rainbow-delimiters-mode +1))

(setq x-lisp-coding-hook 'x-lisp-coding-defaults)

;; interactive modes don't need whitespace checks
(defun x-interactive-lisp-coding-defaults ()
  (smartparens-strict-mode +1)
  (rainbow-delimiters-mode +1)
  (whitespace-mode -1))

(setq x-interactive-lisp-coding-hook 'x-interactive-lisp-coding-defaults)

(provide 'x-lisp)

;;; x-lisp.el ends here
