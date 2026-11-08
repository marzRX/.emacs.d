;; ============================================================
;; Optional settings
;; ============================================================
;; init.el には含めていない追加設定の候補です。
;;
;; ・必要な設定だけ init.el にコピーして利用してください。
;; ・すべての設定を利用する場合は、
;;   init.el の optional-settings.el 読み込み行のコメントを外してください。

;; 現在行のハイライト
(global-hl-line-mode 1)

;; 行番号を表示する(50行へ飛ぶには、M-g g 50[Enter])
(global-display-line-numbers-mode 1)

;; find-file での スペースによる補完
(define-key minibuffer-local-filename-completion-map " " 'minibuffer-complete-word)

;; マウスホイールのスクロール調整
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control)))
      mouse-wheel-progressive-speed nil)

;; キーボードマクロ関係
(global-set-key (kbd "C-c n") 'name-last-kbd-macro)

;; xyzzyに倣って, M-p で直前の複雑なコマンドを再実行（標準は C-x ESC ESC）
(define-key global-map "\M-p" 'repeat-complex-command)
;; Makefile モードでも M-p を repeat-complex-command にする
(with-eval-after-load 'make-mode
  (define-key makefile-gmake-mode-map (kbd "M-p") #'repeat-complex-command))

;; root で起動していることを見た目で分かりやすくするため、
;; 一般ユーザーとは異なる暗色テーマを使用する。
;; 下記設定を root でも利用するには、~/.emacs.d を /root にコピーします。
;; sudo cp -r ~/.emacs.d /root
(cond
 ((not window-system)
  ;; CUI の場合
  (load-theme 'misterioso t)
  (set-face-attribute 'region nil
                      :background "#555753"
                      :foreground "#ffffff"))

 ((string= (user-login-name) "root")
  ;; GUI で root の場合
  (load-theme 'tango-dark t)
  (set-face-attribute 'region nil
                      :background "#3465a4"
                      :foreground "#ffffff"))

 (t
  ;; GUI で root 以外の場合
  (load-theme 'leuven t)
  (set-face-attribute 'region nil
                      :background "#aaaaff"
                      :foreground nil)))

;; ------------------------------------------------------------
;; PostScript printing
;; ------------------------------------------------------------
(require 'ps-print)
(setq ps-multibyte-buffer 'non-latin-printer)
(setq ps-font-size 11.0)
(setq ps-line-spacing 1.2)

