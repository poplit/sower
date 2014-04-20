package SWResource_juna;

#----------------------------------------
# 人狼審問キャラセット（α３〜β１）
# http://briefcase.yahoo.co.jp/jsfun2
#----------------------------------------

sub GetRSChr {
	my $sow = $_[0];

	my $maker = $sow->{'cfg'}->{'CID_MAKER'};
	my $admin = $sow->{'cfg'}->{'CID_ADMIN'};

	# キャラの表示順
	my @order = (
		'01', '02', '03', '04', '05',
		'09', '15', '17', '24', '06',
		'11', '12', '45', '21', '22',
		'13', '14', '27', '08', '31',
		'41', '23', '38', '39', '30',
		'42', '43', '32', '33', '10',
		'37', '28', '29', '36', '40',
		'18', '19', '16', '20', '44',
		'25', '34', '35', '26',
	);

	# キャラの肩書き
	my %chrjob = (
		'01' => '自警団長',
		'02' => '村長',
		'03' => '村長の妻',
		'04' => '村長の娘',
		'05' => '農夫',

		'09' => '鍛冶屋',
		'15' => '木こり',
		'17' => '書生',
		'24' => '隠者',
		'06' => '雑貨屋',

		'11' => '医師',
		'12' => '見習い看護婦',
		'45' => '見習いメイド',
		'21' => '牧師',
		'22' => '修道女',

		'13' => '酒場の主人',
		'14' => '酒場の看板娘',
		'27' => '双子',
		'08' => '双子',
		'31' => '新米記者',

		'41' => '踊り子',
		'23' => '未亡人',
		'38' => '逃亡者',
		'39' => '教師',
		'30' => '学生',

		'42' => '学生',
		'43' => '文学少女',
		'32' => '牧童',
		'33' => 'お嬢様',
		'10' => '流れ者',

		'37' => 'お尋ね者',
		'28' => '冒険家',
		'29' => '美術商',
		'36' => '吟遊詩人',
		'40' => '墓守',

		'18' => '交易商',
		'19' => 'ちんぴら',
		'16' => 'のんだくれ',
		'20' => 'ごくつぶし',
		'44' => '資産家',

		'25' => '語り部',
		'34' => '旅芸人',
		'35' => '旅芸人',
		'26' => '異国人',

		$maker => '',
		$admin => '',
	);

	# キャラの名前
	my %chrname = (
		'01' => 'アーヴァイン',
		'02' => 'アーノルド',
		'03' => 'エレノア',
		'04' => 'シャーロット',
		'05' => 'グレン',

		'09' => 'ゴードン',
		'15' => 'ダニエル',
		'17' => 'ハーヴェイ',
		'24' => 'モーガン',
		'06' => 'レベッカ',

		'11' => 'ヴィンセント',
		'12' => 'ニーナ',
		'45' => 'ネリー',
		'21' => 'ルーサー',
		'22' => 'ステラ',

		'13' => 'フレディ',
		'14' => 'ローズマリー',
		'27' => 'リック',
		'08' => 'ウェンディ',
		'31' => 'ソ\フィー',

		'41' => 'キャロル',
		'23' => 'オードリー',
		'38' => 'カミーラ',
		'39' => 'イザベラ',
		'30' => 'ラッセル',

		'42' => 'メイ',
		'43' => 'セシリア',
		'32' => 'トビー',
		'33' => 'ヘンリエッタ',
		'10' => 'ギルバート',

		'37' => 'クインジー',
		'28' => 'ナサニエル',
		'29' => 'ヒューバート',
		'36' => 'コーネリアス',
		'40' => 'ユージーン',

		'18' => 'ベンジャミン',
		'19' => 'ノーマン',
		'16' => 'ケネス',
		'20' => 'ミッキー',
		'44' => 'ジェーン',

		'25' => 'デボラ',
		'34' => 'ボブ',
		'35' => 'ドリス',
		'26' => 'マンジロー',

		$maker => '天のお告げ（村建て人）',
		$admin => '闇の呟き（管理人）',
	);

	# キャラ名頭文字（人狼譜出力用）
	my %chrnameinitial = (
		'01' => '警',
		'02' => 'ア',
		'03' => 'エ',
		'04' => 'シ',
		'05' => 'グ',

		'09' => 'ゴ',
		'15' => 'ダ',
		'17' => 'ハ',
		'24' => 'モ',
		'06' => 'レ',

		'11' => 'ヴ',
		'12' => 'ニ',
		'45' => 'ネ',
		'21' => 'ル',
		'22' => 'ス',

		'13' => 'フ',
		'14' => 'ロ',
		'27' => 'リ',
		'08' => 'ウ',
		'31' => 'ソ\',

		'41' => 'キ',
		'23' => 'オ',
		'38' => 'カ',
		'39' => 'イ',
		'30' => 'ラ',

		'42' => 'メ',
		'43' => 'セ',
		'32' => 'ト',
		'33' => 'ヘ',
		'10' => 'ギ',

		'37' => 'ク',
		'28' => 'ナ',
		'29' => 'ヒ',
		'36' => 'コ',
		'40' => 'ユ',

		'18' => 'ベ',
		'19' => 'ノ',
		'16' => 'ケ',
		'20' => 'ミ',
		'44' => 'ジ',

		'25' => 'デ',
		'34' => 'ボ',
		'35' => 'ド',
		'26' => 'マ',
	);

	# キャラのラテンアルファベット名（オプション）
	my %chrromanname = (
		'01' => 'Irvine',
		'02' => 'Arnold',
		'03' => 'Eleanor',
		'04' => 'Charlotte',
		'05' => 'Glen',

		'09' => 'Gordon',
		'15' => 'Daniel',
		'17' => 'Harvey',
		'24' => 'Morgan',
		'06' => 'Rebecca',

		'11' => 'Vincent',
		'12' => 'Nina',
		'45' => 'Nellie',
		'21' => 'Luther',
		'22' => 'Stella',

		'13' => 'Freddie',
		'14' => 'Rosemary',
		'27' => 'Rick',
		'08' => 'Wendy',
		'31' => 'Sophie',

		'41' => 'Carole',
		'23' => 'Audrey',
		'38' => 'Camilla',
		'39' => 'Isabella',
		'30' => 'Russel',

		'42' => 'May',
		'43' => 'Cecilia',
		'32' => 'Toby',
		'33' => 'Henrietta',
		'10' => 'Gilbert',

		'37' => 'Quincy',
		'28' => 'Nathaniel',
		'29' => 'Hubert',
		'36' => 'Cornelius',
		'40' => 'Eugene',

		'18' => 'Benjamin',
		'19' => 'Norman',
		'16' => 'Kenneth',
		'20' => 'Micky',
		'44' => 'Jane',

		'25' => 'Deborah',
		'34' => 'Bob',
		'35' => 'Doris',
		'26' => 'Manjiroh',
	);

	# ダミーキャラの発言
	my @npcsay =(
		'　ふむ……まだ集まっていないようだな。　今のうちに、もう一度見回りに行ってくるとしよう。',
		'　あー、諸君、聞いてくれ。もう噂になっているようだが、まずいことになった。<br>　この間の旅人が殺された件、やはり人狼の仕業のようだ。<br><br>　当日、現場に出入り出来たのは今ここにいる者で全部だ。<br>　とにかく十分に注意してくれ。',
	);

	my @expression = (
	);

	my %charset = (
		CAPTION        => '人狼審問',
		NPCID          => '01',
		CHRNAME        => \%chrname,
		CHRJOB         => \%chrjob,
		CHRNAMEINITIAL => \%chrnameinitial,
		CHRROMANNAME   => \%chrromanname,
		ORDER          => \@order,
		NPCSAY         => \@npcsay,
		IMGBODYW       => 64,
		IMGBODYH       => 98,
		DIR            => "$sow->{'cfg'}->{'DIR_IMG'}/juna",
		EXT            => '.png',
		BODY           => '',
		FACE           => '',
		GRAVE          => '',
		EXPRESSION     => \@expression,
		LAYOUT_NAME    => 'right',
	);

	return \%charset;
}

1;