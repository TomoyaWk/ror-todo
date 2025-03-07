.PHONY: all lint test security check

all: check

# 依存関係のチェックとセットアップ
setup:
	@command -v bundle >/dev/null 2>&1 || { echo "bundlerが必要です。インストールしてください。"; exit 1; }
	@bundle check || bundle install

# Rubocopによるlint
lint: setup
	@echo "Lintingを実行中..."
	@bin/rubocop -f github

# テストの実行
test: setup
	@echo "テストを実行中..."
	@bin/rails db:test:prepare
	@bin/rails test test:system

# セキュリティチェック
security: setup
	@echo "セキュリティチェックを実行中..."
	@bin/brakeman --no-pager
	@bin/importmap audit

# 全てのチェックを実行
check: security lint test
	@echo "全てのチェックが完了しました。"
