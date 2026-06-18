# AGT_T009_publish_readiness

## Goal

GitHubとCloudflare Pagesで公開する前に、README、設定値、承認ゲートを整える。

## Input

- `backlog.yaml` の `T009`
- T008の検証結果
- `Context/03_technical_stack_official_context.md`
- `Context/05_constraints_risks_sources.md`

## Output

- README更新案
- Cloudflare Pages設定メモ
- 公開前チェックリスト
- `Documents/T009_publish_readiness.md`

## Execution Flow

1. Autonomous: READMEにローカル起動、ビルド、プロジェクト概要を書く。
2. Autonomous: Cloudflare Pages設定値を整理する。
3. Autonomous: GitHub repository作成、push、Cloudflare接続、外部公開の承認ポイントを明記する。
4. Mob Checkpoint: どこまで実行するか本人確認を取る。
5. Autonomous: 承認された範囲だけ実行または手順化する。
6. Verification: L1で設定値、L2で公開前チェックリストとHITL境界を確認する。

## Guardrails

- GitHub repository作成、`git push`、Cloudflare接続、外部公開、Web Analytics導入は本人承認なしに実行しない。
- 無料サブドメイン優先、独自ドメインは後回しの方針を維持する。
- Cloudflare側の設定は公式ドキュメントに合わせる。

## Agent Instructions

Operation系Agentとして、外部副作用の前に必ず承認を取る。承認がない場合は手順書とチェックリスト作成までで止める。
