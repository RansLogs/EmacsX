;;; x-org.el --- Emacs Prelude: org-mode configuration.


;;; Commentary:

;; Some basic configuration for org-mode.

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

(require 'org)
(require 'org-habit)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; a few useful global keybindings for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-switchb)

(setq org-log-done t)
(setq org-log-into-drawer t)

(defun x-org-mode-defaults ()
  (let ((oldmap (cdr (assoc 'x-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)
    (define-key newmap (kbd "C-c +") nil)
    (define-key newmap (kbd "C-c -") nil)
    (define-key newmap (kbd "C-a") 'org-beginning-of-line)
    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(x-mode . ,newmap) minor-mode-overriding-map-alist))
)

(setq x-org-mode-hook 'x-org-mode-defaults)

(add-hook 'org-mode-hook (lambda () (run-hooks 'x-org-mode-hook)))

(provide 'x-org)

;;; x-org.el ends here
