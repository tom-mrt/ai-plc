# AGT_T006_homepage_mvp

## Goal

名刺QRから見せられる入口として、トップページMVPを実装する。

## Input

- `backlog.yaml` の `T006`
- T004のLayout/Header/Footer
- T005のCoffee Log collection
- `Context/04_product_scope_content_model.md`

## Output

- 更新済み `src/pages/index.astro`
- 必要なカード系コンポーネント
- `Documents/T006_homepage_mvp.md`

## Execution Flow

1. Autonomous: トップページに必要なセクションを確認する。
2. Autonomous: 最新Coffee Logを取得して表示する。
3. Autonomous: 最近のおすすめコーヒーと好きなお店3選を仮データまたは静的セクションで配置する。
4. Autonomous: Coffee Log一覧への導線を作る。
5. Mob Checkpoint: トップページの文言と構成を確認する。
6. Verification: L1で各セクション、L2で名刺QRから見た初見導線を確認する。

## Guardrails

- ヒーローや装飾を過剰にしない。
- 未完成項目を大量に表示しない。
- コンテンツが少なくても公開に耐える密度にする。

## Agent Instructions

最初の完成形は小さくする。UIの派手さではなく、トップからCoffee Logへ自然に進めることを優先する。
