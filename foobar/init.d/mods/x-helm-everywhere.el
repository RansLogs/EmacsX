;;; x-helm-everywhere.el --- Enable Helm everywhere


;;; Commentary:

;; Enable Helm everywhere with global key bindings to replace common
;; global bindings and `helm-mode' is activated to replace `completing-read'
;; with `helm-completing-read-default', so users can use Helm with every prompt.

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
(require 'x-helm)
(x-require-packages '(helm-descbinds helm-ag))
(require 'helm-eshell)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)
(define-key x-mode-map (kbd "C-c f") 'helm-recentf)

(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

;; shell history.
(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (substitute-key-definition 'eshell-list-history 'helm-eshell-history eshell-mode-map)))

(substitute-key-definition 'find-tag 'helm-etags-select global-map)

(helm-descbinds-mode)
(helm-mode 1)

;; enable Helm version of Projectile with replacment commands
(helm-projectile-on)

(provide 'x-helm-everywhere)
;; x-helm-everywhere.el ends here.
