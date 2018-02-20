# ipsj-rename-papers

情報処理学会情報学広場でダウンロードしたPDFのファイル名をわかりやすく変更する手法の提案および実装

# 背景
情報処理学会の論文誌や会誌の記事が情報学広場(https://ipsj.ixsq.nii.ac.jp/)よりダウンロード可能である（会員のみ）．
しかし，ダウンロードされたファイル(export.zip)を展開すると，各記事は 0001/IPSJ-JNL5902100.pdf, 0002/IPSJ-JNL5902101.pdf, ... といったファイル名となっているため，閲覧性に乏しいという問題があった．

# 提案手法
export.zip に含まれる import.xml には記事のタイトルなどの情報がXML形式で含まれている．これを利用し，記事のファイル名を "JNL5902123-タイトル名.pdf" のような形式に変更する．また，数字4桁のディレクトリは削除し，フラットなディレクトリ構造を実現する．

# 使用法

> ruby ipsj-rename-papers.rb <import.xmlを含むディレクトリ名>

# 利用例

    % mkdir tmp
    % cd tmp
    % unzip -x ../export.zip
    Archive:  ../export.zip
      inflating: 0003/IPSJ-TPRO1101003.pdf
      inflating: 0011/IPSJ-TPRO1101011.pdf
      inflating: 0006/IPSJ-TPRO1101006.pdf
      inflating: 0001/IPSJ-TPRO1101001.pdf
      inflating: 0007/IPSJ-TPRO1101007.pdf
      inflating: 0010/IPSJ-TPRO1101010.pdf
      inflating: 0008/IPSJ-TPRO1101008.pdf
      inflating: 0004/IPSJ-TPRO1101004.pdf
      inflating: 0002/IPSJ-TPRO1101002.pdf
      inflating: 0009/IPSJ-TPRO1101009.pdf
      inflating: 0005/IPSJ-TPRO1101005.pdf
      inflating: import.xml
    % ls
    0001       0002       0003       0004       0005       0006       0007       0008       0009
    0010       0011       import.xml
    % ruby /PATH/ipsj-rename-papers.rb .
    rename 0001/IPSJ-TPRO1101001.pdf -> TPRO1101001-「情報処理学会論文誌　プログラミング」の編集について.pdf
    rename 0002/IPSJ-TPRO1101002.pdf -> TPRO1101002-Improvement of a Library for Model Checking under Weakly Ordered Memory Model with SPIN.pdf
    rename 0003/IPSJ-TPRO1101003.pdf -> TPRO1101003-RL78マイコン向けCコンパイラによる多倍長整数演算の最適化.pdf
    rename 0004/IPSJ-TPRO1101004.pdf -> TPRO1101004-Call-trail Dependent Inline Caching for a Scoping Mechanism of Class Extensions.pdf
    rename 0005/IPSJ-TPRO1101005.pdf -> TPRO1101005-Implementation of C Library for Constructing Packrat Parser with Statically Allocated Memory.pdf
    rename 0006/IPSJ-TPRO1101006.pdf -> TPRO1101006-複数の局所クロックを持つ時間プッシュダウン・オートマトン.pdf
    rename 0007/IPSJ-TPRO1101007.pdf -> TPRO1101007-分散環境での並列グラフマイニングにおけるタスク中断処理による冗長探索削減.pdf
    rename 0008/IPSJ-TPRO1101008.pdf -> TPRO1101008-Reducing Memory Fences in a Copying Garbage Collector of Java for Weak Memory Models.pdf
    rename 0009/IPSJ-TPRO1101009.pdf -> TPRO1101009-HOPEコンパイラのプロトタイプ実装.pdf
    rename 0010/IPSJ-TPRO1101010.pdf -> TPRO1101010-分散集合ライブラリを用いた人工市場シミュレーションにおける通信と計算のオーバラップ実現.pdf
    rename 0011/IPSJ-TPRO1101011.pdf -> TPRO1101011-論文誌編集委員会.pdf
    % ls
    TPRO1101001-「情報処理学会論文誌　プログラミング」の編集について.pdf
    TPRO1101002-Improvement of a Library for Model Checking under Weakly Ordered Memory Model with SPIN.pdf
    TPRO1101003-RL78マイコン向けCコンパイラによる多倍長整数演算の最適化.pdf
    TPRO1101004-Call-trail Dependent Inline Caching for a Scoping Mechanism of Class Extensions.pdf
    TPRO1101005-Implementation of C Library for Constructing Packrat Parser with Statically Allocated Memory.pdf
    TPRO1101006-複数の局所クロックを持つ時間プッシュダウン・オートマトン.pdf
    TPRO1101007-分散環境での並列グラフマイニングにおけるタスク中断処理による冗長探索削減.pdf
    TPRO1101008-Reducing Memory Fences in a Copying Garbage Collector of Java for Weak Memory Models.pdf
    TPRO1101009-HOPEコンパイラのプロトタイプ実装.pdf
    TPRO1101010-分散集合ライブラリを用いた人工市場シミュレーションにおける通信と計算のオーバラップ実現.pdf
    TPRO1101011-論文誌編集委員会.pdf
    import.xml

