
;; =========================================================
;; 環境設定
;; =========================================================

;; ロードパス
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(setq load-path (cons "/Applications/Emacs.app/Contents/Resources/site-lisp" load-path))
(setq load-path (cons "/Applications/Emacs.app/Contents/Resources/site-lisp" load-path))
(setq *site-lisp* "/Applications/Emacs.app/Contents/Resources/site-lisp")

;; 行数表示
(require 'linum)
(global-linum-mode)
(setq linum-format "%5d")
(line-number-mode t)
(column-number-mode t)

;; デフォルト文字コード
(set-default-coding-systems 'utf-8)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; バックアップファイルを作らない
(setq backup-inhibited t)
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; タブを半角スペースに
(setq indent-line-function 'indent-relative-maybe)
(setq-default tab-width 4 indent-tabs-mode nil)

;; メニューバーを隠す
(tool-bar-mode -1)

;; 対応する括弧を強調表示させる
(show-paren-mode t)
(setq transient-mark-mode t)

;; カーソルを点滅させない
(blink-cursor-mode 0)

;; ビープ音の代りに画面を点滅させる
(setq visible-bell t)

;; テキストの折り返しをしない
(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;; マウス選択でキルリングに追加しない
(setq mouse-drag-copy-region nil)

;; 1行づつスクロールする
(setq scroll-step 1)

;; =========================================================
;; 画面の色、大きさ設定
;; =========================================================

;; フォント設定
(if (eq window-system 'mac) (require 'carbon-font))
;;(fixed-width-set-fontset "Osaka" 12)

(set-fontset-font
  (frame-parameter nil 'font)
    'japanese-jisx0208
    '("Hiragino Kaku Gothic ProN" . "iso10646-1"))

(setq fixed-width-rescale nil)

;; ウィンドウ設定
(if window-system (progn
                    (setq initial-frame-alist '((width . 120) (height . 36) (top . 0) (left . 20)))
                    (set-background-color "Black")
                    (set-foreground-color "White")
                    (set-cursor-color "Red")))

;; モードラインの文字の色を設定
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mode-line ((((class color) (min-colors 88)) (:background "grey90" :foreground "grey20" :box (:line-width -1 :color "grey75") :family "MeiryoKe_Console"))))
 '(mode-line-inactive ((default (:inherit mode-line)) (((class color) (min-colors 88) (background light)) (:background "grey80" :foreground "grey40" :box (:line-width -1 :color "grey75") :weight light :family "MeiryoKe_Console")))))

;; ウィンドウを透明化
(add-to-list 'default-frame-alist '(alpha . (0.95 0.95)))

;; タブ, 全角, 半角スペースに色を付ける
(defface my-face-b-2 '((t (:foreground "red" :underline t))) nil)
(defface my-face-u-1 '((t (:foreground "red" :underline t))) nil)
(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode())
  (font-lock-add-keywords major-mode '(("\t" 0 my-face-b-2 append)
                                       ("　" 0 my-face-b-2 append)
                                       ("[ \t]+$" 0 my-face-u-1 append)
                                       (" [\r]*\n" 0 my-face-r-1 append))))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; カーソル行をハイライト
(defface hlline-face
  '((((class color) (background dark)) (:background "gray10"))
    (((class color) (background light)) (:background "ForestGreen" :underline nil))
    (t ())) "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; 指定行へジャンプ
(global-set-key (kbd "C-x p") 'goto-line)

;; =========================================================
;;  トラックパッドスクロール設定
;; =========================================================

(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)

;; =========================================================
;; キーバインド
;; =========================================================

;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
;;(pc-selection-mode 1)

;; Macのキーバインドを使う
;;(mac-key-mode 1)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;; ウィンドウ系の操作をコマンドキーで
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-window)
(global-set-key (kbd "s-2") 'split-window-vertically)
(global-set-key (kbd "s-3") 'split-window-horizontally)


;; =========================================================
;; テキスト編集
;; =========================================================

;; A-d (Command-d)で行複製
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank))

(global-set-key (kbd "s-d") 'duplicate-line)

;; A-e　で行削除
(defun kill-whole-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (delete-char 1)
  )

(global-set-key (kbd "s-e") 'kill-whole-line)

(global-set-key (kbd "s-w") 'kill-buffer)

;; 選択してC-M-Tabでインデント
(global-set-key (kbd "<C-M-tab>") 'indent-region)

;; 確認なしでファイル再読み込み
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

;; Cmd + rで再読み込み
(global-set-key (kbd "s-r") 'revert-buffer-no-confirm)

;; 選択して上書き可能
(delete-selection-mode t)

;; やり直しはCmd + Shift + z
(require 'redo)
(global-set-key (kbd "s-Z") 'redo)

;; =========================================================
;; 特殊なモード
;; =========================================================

;; 拡張子設定
(setq auto-mode-alist
      (append '(("\\.ctp$" . html-mode)
                ("\\.lisp$" . lisp-mode))
              auto-mode-alist))

;; フルスクリーンモード
(defun fullscreen-mode ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))
(global-set-key "\C-cm" 'fullscreen-mode)


;; =========================================================
;; diredモードの設定
;; =========================================================

; diredでマークをつけたファイルを開く
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "F") 'my-dired-find-marked-files)
     (defun my-dired-find-marked-files (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))

;; diredでマークをつけたファイルをviewモードで開く
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "V") 'my-dired-view-marked-files)
     (defun my-dired-view-marked-files (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'view-file fn-list)))))

;; rでwdiredモードに入る ディレクトリをバッファのように編集できる
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; =========================================================
;; 各種プラグイン
;; =========================================================

;;
;; auto-install - ELispプログラムのDL、保存、バイトコンパイル、ロードを自動化する
;; (install-elisp "http://www.emacswiki.org/emacs/auto-install.el")
;; ______________________________________________________________________

;; デフォルトは ~/.emacs.d/auto-install/
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)

;; 起動時にEmcsWikiのページ名を補完候補に加える
;;(auto-install-update-emacswiki-package-name t)

;; install-elisp.el互換モードにする
(auto-install-compatibility-setup)

;; ediff関連のバッファを1つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;
;; tabbar
;; (install-elisp "http://www.emacswiki.org/emacs/download/tabbar.el")
;; ______________________________________________________________________

(require 'tabbar)
(tabbar-mode 1)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの長さ
(setq tabbar-separator '(2.5))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "Monaco"
 :background "#333333"
 :foreground "#cccccc"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background "#333333"
 :foreground "#cccccc"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "#333333"
 :foreground "yellow"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.5)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
  '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; タブ切り替えのキーバインド
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<M-tab>") 'tabbar-backward-tab)

;; タブ上をマウス中クリックで kill-buffer
(defun my-tabbar-buffer-help-on-tab (tab)
  "Return the help string shown when mouse is onto TAB."
  (if tabbar--buffer-show-groups
      (let* ((tabset (tabbar-tab-tabset tab))
             (tab (tabbar-selected-tab tabset)))
        (format "mouse-1: switch to buffer %S in group [%s]"
                (buffer-name (tabbar-tab-value tab)) tabset))
    (format "\
mouse-1: switch to buffer %S\n\
mouse-2: kill this buffer\n\
mouse-3: delete other windows"
            (buffer-name (tabbar-tab-value tab)))))

(defun my-tabbar-buffer-select-tab (event tab)
  "On mouse EVENT, select TAB."
  (let ((mouse-button (event-basic-type event))
        (buffer (tabbar-tab-value tab)))
    (cond
     ((eq mouse-button 'mouse-2)
      (with-current-buffer buffer
        (kill-buffer)))
     ((eq mouse-button 'mouse-3)
      (delete-other-windows))
     (t
      (switch-to-buffer buffer)))
    ;; Don't show groups.
    (tabbar-buffer-show-groups nil)))

(setq tabbar-help-on-tab-function 'my-tabbar-buffer-help-on-tab)
(setq tabbar-select-tab-function 'my-tabbar-buffer-select-tab)


;;
;; grep-edit - 複数ファイルの置換を可能にする
;; (install-elisp "http://www.emacswiki.org/emacs/grep-edit.el")
;; ______________________________________________________________________

;; grep-edit provides to edit grep buffer and to apply the changes to
;; the file.
;;

;;; Install:

 (require 'grep-edit)

;; The latest version of this program can be downloaded from
;; http://www.bookshelf.jp/elc/grep-edit.el

;; Usage:
;; You can start editing the text on *grep* buffer. And the changed
;; text is highlighted
;; C-c C-e : apply the highlighting changes to files.
;; C-c C-u : abort
;; C-c C-r : Remove the highlight in the region (The Changes doesn't
;; apply to files)

;;; History:

;; grep-edit 1.0 was released to the net on 12/03/2002
;;; Code:




;;
;; Zen Coding - Zen Coding
;;
;; ______________________________________________________________________

;; Copyright (C) 2009, Chris Done

;; Version: 0.5.1
;; Author: Chris Done <chrisdone@gmail.com>
;; URL: https://github.com/rooney/zencoding
;; Last-Updated: 2011-12-31 Sat
;; Keywords: convenience

;;
;; Example setup:
;;
(add-to-list 'load-path "~/.emacs.d/plugins/zencoding/")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;;
;; Enable the minor mode with M-x zencoding-mode.
;;
;; See ``Test cases'' section for a complete set of expression types.
;;
;; If you are hacking on this project, eval (zencoding-test-cases) to
;; ensure that your changes have not broken anything. Feel free to add
;; new test cases if you add new features.

;;
;; Yasnippet - Yasnippet
;;
;; ______________________________________________________________________

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
(yas/initialize)

;;
;; Browse Kill Ring - キルリングをバッファ表示する
;;
;; ______________________________________________________________________

(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)


;;
;; auto-complete.el - IDEのような入力支援
;;
;; ______________________________________________________________________

(require 'auto-complete-config)
(global-auto-complete-mode 1)

;;
;; anything.el
;;
;; ______________________________________________________________________

(require 'anything-startup)
(define-key global-map (kbd "C-l") 'anything) 

;;
;; migemo - ローマ字のまま日本語をインクリメンタルサーチする（なんか動かない）
;;
;; ______________________________________________________________________

(add-to-list 'load-path "~/.emacs.d/migemo-0.40")
(load "migemo.el.in")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; append-tuareg.el - Tuareg quick installation: Append this file to .emacs.

(add-to-list 'load-path "/usr/share/emacs/site-lisp/tuareg-2.0.6/")
(setq tuareg-library-path "/opt/local/bin")

;;(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "ocamldebug" "Run the Caml debugger" t)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))

(setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting for Japanese character coding

(modify-coding-system-alist 'file "\\.ml\\w?" 'euc-jp-unix)


;;
;; Undo Tree
;;
;; ______________________________________________________________________
(require 'undo-tree)
(global-undo-tree-mode)

(global-set-key (kbd "C-x p") 'goto-line)



;;
;;php-mode
;;
;; ______________________________________________________________________

(add-to-list 'load-path "~/.emacs.d/php-mode-1.13.1/")
(load-library "php-mode")
(require 'php-mode)

;;
;; Proof General
;;
;; ______________________________________________________________________

;; (load-file "/usr/share/emacs/site-lisp/ProofGeneral-4.2/generic/proof-site.el")

;; (setq coq-prog-name "/opt/local/bin/coqtop")

