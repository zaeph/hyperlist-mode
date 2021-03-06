;;; hyperlist-mode.el ---                            -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Wojciech Siewierski

;; Author:  Wojciech Siewierski
;; Keywords: outlines

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; A major-mode for viewing Hyperlists by Geir Isene.
;;
;; See: https://isene.org/hyperlist/

;;; Code:

(defgroup hyperlist nil
  "Hyperlist mode.")

(defgroup hyperlist-faces nil
  "Faces in Hyperlist mode."
  :group 'hyperlist)

(defface hyperlist-condition
  '((((background light)) :foreground "#008000")
    (((background dark))  :foreground "#33a333"))
  "Face for the Hyperlist [conditions]."
  :group 'hyperlist-faces)

(defface hyperlist-operator
  '((((background light)) :foreground "#000080")
    (((background dark))  :foreground "#8C8CFF"))
  "Face for the Hyperlist OPERATORS: (capitals + colon)."
  :group 'hyperlist-faces)

(defface hyperlist-tag
  '((((background light)) :foreground "#800000")
    (((background dark))  :foreground "#ff7777"))
  "Face for the Hyperlist tags: (string + colon)."
  :group 'hyperlist-faces)

(defface hyperlist-hashtag
  '((((background light)) :foreground "#999900")
    (((background dark))  :foreground "#dddd00"))
  "Face for the Hyperlist #hashtags."
  :group 'hyperlist-faces)

(defface hyperlist-quote
  '((((background light)) :foreground "#006666")
    (((background dark))  :foreground "#33aaaa"))
  "Face for the Hyperlist \"quotes\"."
  :group 'hyperlist-faces)

(defface hyperlist-paren
  '((t :inherit hyperlist-quote))
  "Face for the Hyperlist (parens)."
  :group 'hyperlist-faces)

(defface hyperlist-ref
  '((((background light)) :foreground "#660066")
    (((background dark))  :foreground "#dd00dd"))
  "Face for the Hyperlist (parens)."
  :group 'hyperlist-faces)

(defvar hyperlist-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\" "\"" st)
    (modify-syntax-entry ?\( "()" st)
    (modify-syntax-entry ?\) ")(" st)
    (modify-syntax-entry ?\< "(>" st)
    (modify-syntax-entry ?\> ")<" st)
    (modify-syntax-entry ?# "_ p" st)
    st))

(define-derived-mode hyperlist-mode outline-mode "Hyperlist"
  "A major-mode for Hyperlists by Geir Isene."
  (setq font-lock-defaults
        '((("\\[[^]]*\\]" . 'hyperlist-condition)
           ("\"[^\"]*\"" . 'hyperlist-quote)
           ("([^)]*)" . 'hyperlist-paren)
           ("<[^>]*>" . 'hyperlist-ref)
           ("\\b[A-Z]+:" . 'hyperlist-operator)
           ("\\**\s*\\([ a-zA-Z0-9]*[a-zA-Z0-9]:\\)" 1 'hyperlist-tag)
           ("\\_<\\(#\\w+\\)\\_>" 1 'hyperlist-hashtag))
          t)))

(provide 'hyperlist-mode)
;;; hyperlist-mode.el ends here
