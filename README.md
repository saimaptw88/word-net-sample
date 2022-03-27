# README

概要

- WordNet を用いて類義語検索するモデル
- API にはしていない

実行手順

- 日本語 WordNet をダウンロード(http://compling.hss.ntu.edu.sg/wnja/)
- ダウンロードしたデータベースを解凍し、db ディレクトリ直下に移動する(db/wnjpn.db)
- rails console を開き WordNet.synonyms_search(word: 検索したい用語)を実行( WordNet.synonyms_search(word: "ネコ") )
