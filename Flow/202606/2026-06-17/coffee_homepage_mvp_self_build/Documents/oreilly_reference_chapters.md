# O'Reilly Reference Chapters for Coffee Homepage MVP

Generated: 2026-06-17

Purpose: Astro + TypeScript + MDX + Tailwind CSS + daisyUIでコーヒー個人サイトMVPを自作するために、O'Reilly Online Learning上で読める参考章をタスク別に整理する。

Scope note:
- Astro / Tailwind CSS / daisyUI / Cloudflare Pagesは更新が速いため、実装手順そのものは公式ドキュメントを主教材にする。
- O'Reilly本は、HTML/CSS/TypeScript/Gitの基礎理解と詰まりどころの補助に使う。
- 章リンクはChromeでO'Reilly Online Learning上の表示を確認できたものに限定した。

## 推奨の読み方

1. T001-T002前: Webの仕組み、HTMLの最小構造、Gitのローカル操作だけ読む。
2. T003-T004前: CSS基礎、セレクタ、余白、Flexbox/Gridを必要に応じて拾う。
3. T005-T007前: TypeScriptの型、object、interfaceを読む。
4. T008前: CSSのレイアウト章を辞書的に使う。
5. T009前: GitHub/remote repository関連の章だけ読む。

## T001-T002: Web基礎とAstro最小起動前

### Learning Web Design, 6th Edition

- [Book top](https://learning.oreilly.com/library/view/learning-web-design/9781098137670/)
- [Chapter 3. Some Big Concepts You Need to Know](https://learning.oreilly.com/library/view/learning-web-design/9781098137670/LWD6_ch03_Big_Concepts.xhtml)
  - 用途: Webページ、ブラウザ、URL、アクセシビリティなどの前提確認。
- [Chapter 4. Creating a Simple Page](https://learning.oreilly.com/library/view/learning-web-design/9781098137670/LWD6_ch04_Simple_Page.xhtml)
  - 用途: Astroを触る前に、HTMLがどうページになるかを理解する。
- [Chapter 5. Marking Up Text](https://learning.oreilly.com/library/view/learning-web-design/9781098137670/LWD6_ch05_Formatting_Text.xhtml)
  - 用途: Coffee Log本文や見出し、段落、リンクの意味づけを理解する。

## T003-T004: CSS / UI基盤

### Learning Web Design, 6th Edition

- [Chapter 11. Introducing Cascading Style Sheets](https://learning.oreilly.com/library/view/learning-web-design/9781098137670/LWD6_ch11_Intro_to_CSS.xhtml)
  - 用途: Tailwind/daisyUIの前に、CSSが何をしているかを確認する。
- [Chapter 13. Colors and Backgrounds](https://learning.oreilly.com/library/view/learning-web-design/9781098137670/LWD6_ch13_Colors_and_Backgrounds.xhtml)
  - 用途: 色・背景・読みやすさの基礎確認。

### CSS: The Definitive Guide, 5th Edition

- [Book top](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/)
- [Chapter 1. CSS Fundamentals](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch01.html)
  - 用途: CSSの基本概念を確認する辞書。
- [Chapter 2. Selectors](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch02.html)
  - 用途: Tailwind以外の素のCSSを読む必要が出たときの補助。
- [Chapter 5. Values and Units](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch05.html)
  - 用途: `rem`, `%`, `px`, viewport単位の違いを確認する。
- [Chapter 7. Padding, Borders, Outlines, and Margins](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch07.html)
  - 用途: 余白やカードの見た目が崩れたときの確認。
- [Chapter 11. Flexible Box Layout](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch11.html)
  - 用途: Header、カード一覧、横並びUIの理解。
- [Chapter 12. Grid Layout](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch12.html)
  - 用途: Coffee Log一覧や写真グリッドの理解。

## T005-T007: TypeScript / Content Collections / MDX

### Learning TypeScript

- [Book top](https://learning.oreilly.com/library/view/learning-typescript/9781098110321/)
- [Chapter 1. From JavaScript to TypeScript](https://learning.oreilly.com/library/view/learning-typescript/9781098110321/ch01.html)
  - 用途: JavaScriptとTypeScriptの違いを把握する。
- [Chapter 2. The Type System](https://learning.oreilly.com/library/view/learning-typescript/9781098110321/ch02.html)
  - 用途: Astroのschemaや型エラーへの向き合い方を理解する。
- [Chapter 3. Unions and Literals](https://learning.oreilly.com/library/view/learning-typescript/9781098110321/ch03.html)
  - 用途: `type: "home" | "cafe"` のようなCoffee Log分類を考えるときに使う。
- [Chapter 4. Objects](https://learning.oreilly.com/library/view/learning-typescript/9781098110321/ch04.html)
  - 用途: frontmatterやContent Collectionのデータ構造を理解する。
- [Chapter 7. Interfaces](https://learning.oreilly.com/library/view/learning-typescript/9781098110321/ch07.html)
  - 用途: 記事データやコンポーネントpropsの形を説明できるようにする。

## T008: ビルド前の表示・レスポンシブ確認

### CSS: The Definitive Guide, 5th Edition

- [Chapter 6. Basic Visual Formatting](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch06.html)
  - 用途: ボックス、通常フロー、幅・高さの考え方を確認する。
- [Chapter 10. Floating and Positioning](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch10.html)
  - 用途: 位置指定で表示が崩れたときの辞書。
- [Chapter 11. Flexible Box Layout](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch11.html)
  - 用途: スマホ幅でHeaderやカードを調整する。
- [Chapter 12. Grid Layout](https://learning.oreilly.com/library/view/css-the-definitive/9781098117603/ch12.html)
  - 用途: 一覧ページをレスポンシブに整える。

## T009: GitHub / Cloudflare公開準備

### Learning Git

- [Book top](https://learning.oreilly.com/library/view/learning-git/9781098133900/)
- [Chapter 1. Git and the Command Line](https://learning.oreilly.com/library/view/learning-git/9781098133900/lg_ch01.xhtml)
  - 用途: Git操作の前提確認。
- [Chapter 2. Local Repositories](https://learning.oreilly.com/library/view/learning-git/9781098133900/lg_ch02.xhtml)
  - 用途: ローカルrepositoryの作り方と状態確認。
- [Chapter 3. Making a Commit](https://learning.oreilly.com/library/view/learning-git/9781098133900/lg_ch03.xhtml)
  - 用途: MVPの区切りごとにcommitする感覚をつかむ。
- [Chapter 6. Hosting Services and Authentication](https://learning.oreilly.com/library/view/learning-git/9781098133900/lg_ch06.xhtml)
  - 用途: GitHub連携や認証の前提確認。
- [Chapter 7. Creating and Pushing to a Remote Repository](https://learning.oreilly.com/library/view/learning-git/9781098133900/lg_ch07.xhtml)
  - 用途: GitHub repo作成、remote追加、pushの理解。

## 後回しでよいもの

- Responsive Web Design with HTML5 and CSS - Fourth Edition
  - O'Reilly上の本トップは確認できたが、今回Chromeで章タイトル付きの直接リンク確認が安定しなかったため、このリンク集には章リンクを入れない。
  - CSSの詳細確認は上記の `CSS: The Definitive Guide, 5th Edition` で代替する。
- JavaScript: The Definitive Guide
  - Astro MVPではJavaScriptの深い理解より、HTML/CSS/TypeScriptの最小理解が先。
- Effective TypeScript
  - MVP後の改善向け。初回実装では `Learning TypeScript` を優先する。

## 実装時の対応表

| Backlog Task | 先に読む章 | 読み方 |
| --- | --- | --- |
| T001 | Learning Git Ch.1-2 | Gitの基本操作だけ確認 |
| T002 | Learning Web Design Ch.3-4 | HTMLとWebページの感覚をつかむ |
| T003 | Learning Web Design Ch.11, CSS DG Ch.1-2 | Tailwind/daisyUIの裏側を軽く理解 |
| T004 | CSS DG Ch.7, Ch.11 | 余白とHeader/Footer配置の補助 |
| T005 | Learning TypeScript Ch.1-4 | Content Collection schema前の準備 |
| T006 | Learning Web Design Ch.13, CSS DG Ch.7 | トップページの見た目調整 |
| T007 | Learning TypeScript Ch.4, CSS DG Ch.11-12 | 一覧・詳細ページのデータと配置 |
| T008 | CSS DG Ch.6, Ch.10-12 | 表示崩れの辞書 |
| T009 | Learning Git Ch.6-7 | GitHub公開準備 |
