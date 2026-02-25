# ガイドマップ: AI・担当者向けページ構成と編集指針

このサイトは運用のしやすさと、AI（自然言語）を用いた更新の安全性を確保するために、特定のルールに従って設計されています。

## 1. ページ対応表（URLと物理ファイル）

静的HTML構成を保ちつつ、すべてのページが `/ディレクトリ名/index.html` という構造になっています。

| ページ名 | URL | 物理ファイル (リポジトリパス) | 備考 |
| :--- | :--- | :--- | :--- |
| **トップページ** | `/` | `/index.html` | メインの入り口 |
| **会社概要** | `/company/` | `/company/index.html` | |
| **採用情報** | `/recruit/` | `/recruit/index.html` | |
| **お問い合わせ**| `/contact/` | `/contact/index.html` | |
| **プライバシー**| `/privacy-policy/` | `/privacy-policy/index.html` | |
| **事業領域（太陽光）**| `/services/solar/` | `/services/solar/index.html` | |
| **事業領域（蓄電池）**| `/services/battery/` | `/services/battery/index.html` | |
| **事業領域（リフォーム）**| `/services/reform/` | `/services/reform/index.html` | |
| **事業領域（空調）**| `/services/air/` | `/services/air/index.html` | |
| **事業領域（通信/新電力）**| `/services/internet/` | `/services/internet/index.html` | |
| **導入事例（太陽光）**| `/works/solar/` | `/works/solar/index.html` | |
| **ニュース一覧**| `/news/` | `/news/index.html` | |
| **ニュース詳細 (Tohoku)**| `/news/tohoku/` | `/news/tohoku/index.html` | |
| **ニュース詳細 (Shime)**| `/news/shime/` | `/news/shime/index.html` | |
| **ニュース詳細 (2020)**| `/news/2020/` | `/news/2020/index.html` | |
| **ニュース詳細 (標準)**| `/news/detail/` | `/news/detail/index.html` | |
| **シミュレーション**| `/simulation/` | `/simulation/index.html` | |

> **旧URLについて:**
> 古いURL（例: `company.html`）へアクセスした場合、自動で新しいディレクトリ型URL（例: `/company/`）へリダイレクトされるようスタブファイルが設置されています。これらスタブHTMLの編集は不要です。

## 2. アセットの格納ルール

参照エラーや相対パスのミスを防ぐため、リソース類は以下のディレクトリに格納し、必ず**絶対パス**（`/assets/...`）で読み込んでください。

* **画像:** `/assets/img/` (例: `<img src="/assets/img/photo.png">`)
* **アイコン・ロゴ:** `/assets/icons/` (例: `<img src="/assets/icons/logo.png">`)
* **動画:** `/assets/video/` (例: `<source src="/assets/video/movie.mp4">`)
* **CSS:** `/assets/css/` (例: `<link href="/assets/css/index.css">`)

## 3. AI編集用マーカー (`<!-- AI:EDIT START/END -->`)

ページ全体のレイアウトを壊さずにコンテンツ更新だけを行うため、各HTMLには以下のコメントブロックが埋め込まれています。内容を修正・追記する場合は、このマーカーの内側**のみ**をターゲットとしてください。

### A. ページメタ情報
タイトルやOGP、Descriptionの変更用です。
```html
<!-- AI:EDIT START page_meta -->
<title>会社概要 | 株式会社リジョイス・ビズ</title>
<!-- ... その他のmetaタグ ... -->
<!-- AI:EDIT END page_meta -->
```

### B. メインコンテンツ領域
本文、セクション、画像の追加・修正用です。ヘッダーやフッターはこの外側にあり保護されます。
```html
<!-- AI:EDIT START main_content -->
<section>
  ... コンテンツ ...
</section>
<!-- AI:EDIT END main_content -->
```

## 4. ニュースの追加手順 (AI向け)

新しいニュースページを作成する手順は以下の通りです。

1. **テンプレートの複製**:
   `/news/_template/index.html` ファイルをコピーし、新しいディレクトリ（例: `/news/new-topic/index.html`）に配置します。
2. **メタ情報・本文の編集**:
   `AI:EDIT START page_meta` および `AI:EDIT START main_content` の範囲内にある、タイトル、日付、内容を書き換えます。デザインクラスは変更しないでください。
3. **一覧ページの更新**:
   `/news/index.html` のメインコンテンツ領域内にあるリストの先頭へ、新しいニュースへのリンク（`<a href="/news/new-topic/">`）を追記します。
