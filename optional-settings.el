;; ============================================================
;; Optional settings
;; ============================================================
;; init.el には含めていない追加設定の候補です。
;; 必要な設定だけ init.el にコピーして利用してください。


;; 選択範囲の背景色変更
(set-face-attribute 'region nil :background "#aaF")

;; 現在行のハイライト
(global-hl-line-mode 1)

;; 行番号を表示する(50行へ飛ぶには、M-g g 50[Enter])
(global-display-line-numbers-mode 1)

;; rootで起動したEmacsのテーマ変更
(when (string= (user-login-name) "root")
  (load-theme 'tango-dark t))

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

;; ------------------------------------------------------------
;; PostScript printing
;; ------------------------------------------------------------
(require 'ps-print)
(setq ps-multibyte-buffer 'non-latin-printer)
(setq ps-font-size 11.0)
(setq ps-line-spacing 1.2)

