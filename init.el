;; 起動時のスタートアップ画面を表示しない
(setq inhibit-startup-screen t)

;; *scratch* バッファの初期メッセージを表示しない
(setq initial-scratch-message nil)

;; C-h を Backspace に変更
;; C-h の標準ヘルプ機能は F1 キーから引き続き利用できる
(global-set-key (kbd "C-h") #'backward-delete-char-untabify)

;; End キーで Undo
(global-set-key (kbd "<end>") #'undo-only)

;; Shift + End キーで Redo（Emacs 28以降）
(when (fboundp 'undo-redo)
  (global-set-key (kbd "S-<end>") #'undo-redo))

;; ツールバーを表示しない
(tool-bar-mode -1)

;; 外部エディタで保存したら自動反映
(global-auto-revert-mode 1)

;; Linux で漢字を日本語フォントで表示する
(when (and (eq system-type 'gnu/linux)
           (find-font (font-spec :family "Noto Sans CJK JP")))
  (set-fontset-font t 'han "Noto Sans CJK JP"))

;; フォントサイズを11ptへ(デフォルトは10pt)
(set-face-attribute 'default nil :height 110)

;; ビープ音を鳴らさない
(setq ring-bell-function 'ignore)

;; 対応する括弧を強調
(show-paren-mode 1)
