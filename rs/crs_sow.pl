package SWResource_sow;

#----------------------------------------
# 人狼物語キャラセット
#----------------------------------------

sub GetRSChr {
	my $sow = $_[0];

	my $maker = $sow->{'cfg'}->{'CID_MAKER'};
	my $admin = $sow->{'cfg'}->{'CID_ADMIN'};
	my $guest = $sow->{'cfg'}->{'CID_GUEST'};

	# キャラの表示順
	my @order = (
		'01', '02', '03', '04', '05',
		'06', '07', '08', '09', '10',
		'11', '12', '13', '14', '15',
		'16', '17', '18', '19', '20',
		'21', '22', '23', '24', '25',
		'26', '27', '28', '29', '30',
		'31', '32',
	);

	# キャラの肩書き
	my %chrjob = (
		'01'   => '少女',
		'02'   => 'マッチ売り',
		'03'   => '踊り子',
		'04'   => '家事手伝い',
		'05'   => '貴族の娘',
		'06'   => '悪戯好き',
		'07'   => '読書好き',
		'08'   => '子爵の妹',
		'09'   => '子爵',
		'10'   => '娼婦',
		'11'   => '貴婦人',
		'12'   => '家庭教師',
		'13'   => 'メイド',
		'14'   => '猫娘',
		'15'   => '女学生',
		'16'   => '修道女',
		'17'   => '犬少年',
		'18'   => '司祭',
		'19'   => 'シェフ',
		'20'   => '旅行者',
		'21'   => '少年',
		'22'   => '学生',
		'23'   => '酒場の主人',
		'24'   => '高利貸し',
		'25'   => '税吏',
		'26'   => '青年',
		'27'   => '隠居人',
		'28'   => '孤児',
		'29'   => 'ダンサー',
		'30'   => '宿屋の女主人',
		'31'   => '流れ者',
		'32'   => 'ならず者',
		$maker => '',
		$admin => '',
	);

	# キャラの名前
	my %chrname = (
		'01' => 'アニー',
		'02' => 'クロウ',
		'03' => 'ヴァネッサ',
		'04' => 'ヘレン',
		'05' => 'ジャネット',
		'06' => 'イリス',
		'07' => 'リュー',
		'08' => 'フロル',
		'09' => 'ウィリアム',
		'10' => 'ノーマ',
		'11' => 'エリザ',
		'12' => 'ソニア',
		'13' => 'セリア',
		'14' => 'ミーア',
		'15' => 'ポーラ',
		'16' => 'テレサ',
		'17' => 'ディン',
		'18' => 'ザビエル',
		'19' => 'ケナー',
		'20' => 'ゲイリー',
		'21' => 'ユーリー',
		'22' => 'バーニィ',
		'23' => 'ロベール',
		'24' => 'ワット',
		'25' => 'デビッド',
		'26' => 'ガルシア',
		'27' => 'モートン',
		'28' => 'ルナ',
		'29' => 'ビンバ',
		'30' => 'スーザン',
		'31' => 'ネイ',
		'32' => 'ドネルス',
		$maker    => '天のお告げ（村建て人）',
		$admin    => 'ゆーろ（管理人）',
		$guest    => &SWUser::GetHandle,
	);

	# キャラのラテンアルファベット名（オプション）
	my %chrromanname = (
		'01' => 'Annie',
		'02' => 'Krow',
		'03' => 'Vannesa',
		'04' => 'Helen',
		'05' => 'Janet',
		'06' => 'Iris',
		'07' => 'Lyric',
		'08' => 'Flor',
		'09' => 'William',
		'10' => 'Norma',
		'11' => 'Eliza',
		'12' => 'Sonia',
		'13' => 'Cellia',
		'14' => 'Meer',
		'15' => 'Paula',
		'16' => 'Teresa',
		'17' => 'Din',
		'18' => 'Xavier',
		'19' => 'Qena',
		'20' => 'Gary',
		'21' => 'Yury',
		'22' => 'Bernie',
		'23' => 'Robert',
		'24' => 'Watt',
		'25' => 'Devid',
		'26' => 'Garcia',
		'27' => 'Morton',
		'28' => 'Luna',
		'29' => 'Bimba',
		'30' => 'Susan',
		'31' => 'Nei',
		'32' => 'Donnels',
	);

	# キャラ名頭文字（人狼譜出力用）
	my %chrnameinitial = (
		'01' => 'ア',
		'02' => 'ク',
		'03' => 'ヴ',
		'04' => 'ヘ',
		'05' => 'ジ',
		'06' => 'イ',
		'07' => 'リ',
		'08' => 'フ',
		'09' => 'ウ',
		'10' => 'ノ',
		'11' => 'エ',
		'12' => 'ソ\',
		'13' => 'セ',
		'14' => 'ミ',
		'15' => 'ポ',
		'16' => 'テ',
		'17' => 'デ',
		'18' => 'ザ',
		'19' => 'ケ',
		'20' => 'ゲ',
		'21' => 'ユ',
		'22' => 'バ',
		'23' => 'ロ',
		'24' => 'ワ',
		'25' => 'デ',
		'26' => 'ガ',
		'27' => 'モ',
		'28' => 'ル',
		'29' => 'ビ',
		'30' => 'ス',
		'31' => 'ネ',
		'32' => 'ド',
	);

	# ダミーキャラの発言
	my @npcsay =(
		'たいへん、たいへん、たいへん！',
		'大変よ、人狼が出たの！　いつもは嘘だけど、今度は本当の本当に本当なの！',
	);

	my @expression = (
	);

	my %charset = (
		CAPTION        => '人狼物語',
		NPCID          => '06',
		CHRNAME        => \%chrname,
		CHRJOB         => \%chrjob,
		CHRNAMEINITIAL => \%chrnameinitial,
		ORDER          => \@order,
		NPCSAY         => \@npcsay,
		IMGFACEW       => 85,
		IMGFACEH       => 90,
		IMGBODYW       => 90,
		IMGBODYH       => 135,
#		IMGMOBILEW     => 16,
#		IMGMOBILEH     => 16,
		DIR            => "$sow->{'cfg'}->{'DIR_IMG'}/sow",
		EXT            => '.png',
		BODY           => '_body',
		FACE           => '_face',
		GRAVE          => '',
		WOLF           => '',
		EXPRESSION     => \@expression,
		LAYOUT_NAME    => 'right',
	);

	return \%charset;
}

1;
