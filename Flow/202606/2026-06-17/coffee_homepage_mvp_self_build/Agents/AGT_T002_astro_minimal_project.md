# AGT_T002_astro_minimal_project

## Goal

Docker上でAstroの最小プロジェクトを作成し、ホストMacをできるだけ汚さずに初期ページを表示できる状態にする。

## Input

- `backlog.yaml` の `T002`
- `Documents/T001_environment_check.md`
- `Context/02_beginner_learning_path.md`
- `Context/03_technical_stack_official_context.md`

## Output

- 作成されたAstroプロジェクト
- `compose.yaml`
- `Documents/T002_astro_minimal_project.md`
- Docker Compose経由の `npm run dev` 確認結果
- `src/pages/index.astro` の最小編集結果

## Execution Flow

1. Autonomous: T001成果物から作業ディレクトリとプロジェクト名を確認する。
2. Mob Checkpoint: DockerでAstroプロジェクトを作成するコマンドを提示し、実行可否を確認する。
3. Autonomous: `node:22-bookworm` コンテナ内でAstroプロジェクトを作成する。ホストでは `npm install` を直接実行しない。
4. Autonomous: `compose.yaml` を作成し、`node_modules` をDocker named volumeに逃がす。
5. Autonomous: `docker compose up` でローカル起動し、初期表示を確認する。
6. Autonomous: `src/pages/index.astro` を最小編集し、画面反映を確認する。
7. Verification: L1で起動可否、L2で次のTailwind導入に進めるDocker構成か確認する。

## Guardrails

- 古いテンプレート記事ではなく、現時点のAstro公式手順を優先する。
- 生成された初期ファイルを無関係に大きく改変しない。
- dev serverを起動した場合、ユーザーにURLを伝える。
- ホストMacに `node_modules` を作らない。依存関係はDocker named volumeに置く。
- Docker image pullとvolume作成以外の外部副作用は避ける。

## Agent Instructions

実装より先に「Dockerで動く最小状態」を作る。失敗した場合は、エラー全文を保存し、T003へ進まない。
