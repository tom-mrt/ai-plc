# Goal and Decision Context

## Goal

ホームページ作成と関連技術スタックが初めての状態から、コーヒー個人サイトのMVPを自力で作成できるようにする。

MVPは `トップページ + Coffee Log` に絞る。実装そのものより先に、学習順、作業順、スコープ、検証方法を明確化する。

## User Context

- ホームページ作成は初めて。
- Astro、TypeScript、MDX、Tailwind CSS、daisyUI、Cloudflare Pages も初めてまたは実務的には未経験。
- 「自分で作る楽しさ」と「拡張性」を重視する。
- PCでMarkdown/MDXを書いて更新する運用は受け入れ可能。
- GitHub運用への抵抗は低い。
- スマホ更新より、まずはPCで確実に作れることを優先する。
- コストは無料から月数百円程度を希望。

## Prior Decision Context

2026-06-17にChrome経由で確認したChatGPT会話では、以下の方向性が合意済みだった。

- Framework: Astro
- Language: TypeScript
- Content: MDX + Astro Content Collections
- Style: Tailwind CSS
- UI: daisyUI
- Hosting: Cloudflare Pages
- Analytics: Cloudflare Web Analytics
- Repository: GitHub
- Domain: 最初は無料サブドメイン、後から独自ドメイン
- MVP: トップページ + Coffee Log

## Scope

### In Scope

- トップページ
- Coffee Log一覧
- Coffee Log詳細
- サンプルMDX記事
- 最小限のカードUI
- ローカルでの起動とビルド確認
- GitHub連携の準備
- Cloudflare Pages公開の手順化

### Out of Scope for MVP

- Headless CMS
- DB
- 店舗マップ
- 検索
- RSS
- 認証
- 管理画面
- Next.jsへの移行
- 独自ドメイン取得

## Human-in-the-loop Boundaries

以下は本人承認なしに実行しない。

- GitHubリポジトリ作成
- `git push`
- Cloudflare Pagesへのデプロイ設定
- 外部公開
- Cloudflare Web Analyticsの本番導入
- 独自ドメイン取得やDNS設定

## Success Criteria

- ユーザーが「次に何をやるか」を迷わず説明できる。
- MVP実装のタスクが初心者向けに小さく分解されている。
- それぞれの作業に確認ポイントがある。
- 技術選定の理由と後回し項目の理由が記録されている。
