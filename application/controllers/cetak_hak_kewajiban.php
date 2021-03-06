<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class cetak_hak_kewajiban extends OPPController {

	public function __construct() {
		parent::__construct();

		$this->load->helper('fungsi');
		$this->load->model('general_m');
		$this->load->model('pinjaman_m');
		$this->load->model('setting_m');
		$this->load->model('lap_kas_anggota_m');
		$this->load->model('simpanan_m');
		$this->load->model('angsuran_m');
        // angka
		$this->load->library('terbilang');
	}

	// function laporan() {
	// 	$data_ajuan = $this->pinjaman_m->get_pengajuan_cetak();
	// 	$opsi_val_arr = $this->setting_m->get_key_val();
	// 	foreach ($opsi_val_arr as $key => $value) {
	// 		$out[$key] = $value;
	// 	}

	// 	//var_dump($data_ajuan);
	// 	//exit();
	// 	if($data_ajuan['total'] == 0) {
	// 		echo 'Data Kosong';
	// 		exit();
	// 	}
	// 	$list = $data_ajuan['rows'];

	// 	$fr_jenis = isset($_REQUEST['fr_jenis']) ? explode(',', $_REQUEST['fr_jenis']) : array();
	// 	$fr_status = isset($_REQUEST['fr_status']) ? explode(',', $_REQUEST['fr_status']) : array();		
		
	// 	$fr_jenis = array_diff($fr_jenis, array(NULL)); // NULL / FALSE / ''
	// 	$fr_status = array_diff($fr_status, array(NULL)); // NULL / FALSE / ''

	// 	$fr_bulan = isset($_REQUEST['fr_bulan']) ? $_REQUEST['fr_bulan'] : '';
		
	// 	if($fr_bulan != '') {
	// 		$bln_dari = date("Y-m-d", strtotime($fr_bulan . "-01 -1 month"));
	// 		$tgl_dari = substr($bln_dari, 0, 7) . '-21';
	// 		$tgl_sampai = $fr_bulan . '-20';
	// 	} else {
	// 		$tgl_dari = $_REQUEST['tgl_dari']; 
	// 		$tgl_sampai = $_REQUEST['tgl_sampai'];
	// 	}	


	// 	//$fr_jenis = explode(',', $fr_jenis);
	// 	//$fr_status = explode(',', $fr_status);

	// 	if(! empty($fr_jenis)) {
	// 		$txt_jenis = implode(', ', $fr_jenis);
	// 	} else {
	// 		$txt_jenis = "Semua";
	// 	}
	// 	$status_arr = array(0 => 'Menunggu Konfirmasi', 1 => 'Disetujui', 2 => 'Ditolak', 3 => 'Sudah Terlaksana', 4 => 'Batal');
	// 	if(! empty($fr_status)) {
	// 		$status_rep = str_replace(
	// 			array('0', '1', '2', '3', '4'), 
	// 			array('Menunggu Konfirmasi', 'Disetujui', 'Ditolak', 'Sudah Terlaksana', 'Batal'), 
	// 			$fr_status);
	// 		$txt_status = implode(', ', $status_rep);
	// 		//echo $txt_status; exit();
	// 	} else {
	// 		$txt_status = "Semua";
	// 	}
	// 	//echo $txt_status; exit();
	// 	$this->load->library('Pdf');
	// 	$pdf = new Pdf('L', 'mm', 'A4', true, 'UTF-8', false);
	// 	$pdf->set_nsi_header(TRUE);
	// 	$pdf->AddPage('L');
	// 	$html = '';
	// 	$html .= '
	// 	<style>
	// 		.h_tengah {text-align: center;}
	// 		.h_kiri {text-align: left;}
	// 		.h_kanan {text-align: right;}
	// 		.txt_judul {font-size: 15pt; font-weight: bold; padding-bottom: 12px;}
	// 		.header_kolom {background-color: #cccccc; text-align: center; font-weight: bold;}
	// 	</style>
	// 	'.$pdf->nsi_box($text = '<span class="txt_judul">Laporan Data Pengajuan <br></span> <span> Periode '.jin_date_ina($tgl_dari).' - '.jin_date_ina($tgl_sampai).' | Jenis: '.$txt_jenis.' | Staus: '.$txt_status.' </span> ', $width = '100%', $spacing = '0', $padding = '1', $border = '0', $align = 'center').'
	// 	<table width="100%" cellspacing="0" cellpadding="3" border="1">
	// 		<tr class="header_kolom" pagebreak="false">
	// 			<th style="width:3%;" >No</th>
	// 			<th style="width:8%;">ID Ajuan</th>
	// 			<th style="width:10%;">NIK</th>
	// 			<th style="width:25%;">Nama</th>
	// 			<th style="width:11%;">Dept</th>
	// 			<th style="width:8%;">Tanggal</th>
	// 			<th style="width:10%;">Nominal</th>
	// 			<th style="width:10%;">Pelunasan</th>
	// 			<th style="width:3%;">Bln</th>
	// 			<th style="width:12%;">Status</th>
	// 		</tr>';
	// 	$no =1;
	// 	$total_nominal = 0;
	// 	$total_sisa_arr = array();
	// 	foreach ($list as $row) {
	// 		$sisa_tagihan = '-';
	// 		if($row->jenis != 'Darurat') {
	// 			$sisa_tagihan = $row->sisa_tagihan;
	// 			$total_sisa_arr[$row->anggota_id] = str_replace(',', '', $row->sisa_tagihan);
	// 		}
	// 		$html .= '
	// 		<tr nobr="true">
	// 			<td class="h_tengah">'.$no++.' </td>
	// 			<td class="h_tengah">'.$row->ajuan_id.'</td>
	// 			<td cla	s="h_tengah">'.$row->identitas.'</td>
	// 			<td>'.$row->nama.'</td>
	// 			<td>'.$row->departement.'</td>
	// 			<td class="h_tengah">'.$row->tgl_input_txt.'</td>
	// 			<td class="h_kanan">'.$row->nominal.'</td>
	// 			<td class="h_kanan">'.$sisa_tagihan.'</td>
	// 			<td class="h_tengah">'.$row->lama_ags.'</td>
	// 			<td>'.$status_arr[$row->status].'</td>
	// 		</tr>
	// 		';
	// 		$total_nominal += str_replace(',', '', $row->nominal);
	// 	}
	// 	$total_sisa = 0;
	// 	foreach ($total_sisa_arr as $val) {
	// 		$total_sisa += $val;
	// 	}

	// 	$html .= '
	// 	<tr>
	// 		<td colspan="6" class="h_kanan"> <strong> Total </strong> </td>
	// 		<td class="h_kanan"><strong> '.number_format(nsi_round($total_nominal)).' </strong></td>
	// 		<td class="h_kanan"><strong> '.number_format(nsi_round($total_sisa)).' </strong></td>
	// 		<td colspan="2"></td>
	// 	</tr>';
	// 	$html .= '</table>';

	// 	$html .= '
	// 	<br><br>
	// 	<table width="97%">
	// 	<tr>
	// 		<td class="h_tengah" height="50px" width="40%">Dibuat oleh,</td>
	// 		<td class="h_tengah" width="60%"> '.$out['kota'].', '.jin_date_ina(date('Y-m-d')).'</td>
	// 	</tr>
	// 	<tr>
	// 		<td class="h_tengah"> BENDAHARA </td>
	// 		<td class="h_tengah"> KETUA </td>
	// 	</tr>
	// 	</table>';

	// 	$pdf->nsi_html($html);
	// 	$pdf->Output('pinjam'.date('Ymd_His') . '.pdf', 'I');       
	// }

	function cetak($id) {
		$row = $this->pinjaman_m->get_data_pengajuan($id);
		
		$data_pinjam = $this->pinjaman_m->lap_data_pinjaman();

		// $tgl_dari = $_REQUEST['tgl_dari']; 
		// $tgl_sampai = $_REQUEST['tgl_sampai']; 
		// $cari_status = $_REQUEST['cari_status']; 

		// if ($cari_status == "") {
		// 	$status = "Status Pelunasan : Semua";
		// } else {
		// 	$status = "Status Pelunasan :". $cari_status ;
		// }

		$anggota = $this->lap_kas_anggota_m->lap_data_anggota();
		$data_jns_simpanan = $this->lap_kas_anggota_m->get_jenis_simpan();

		$opsi_val_arr = $this->setting_m->get_key_val();
		foreach ($opsi_val_arr as $key => $value){
			$out[$key] = $value;
		}

		$this->load->library('Struk');
		$pdf = new Struk('P', 'mm', 'A4', true, 'UTF-8', false);
		$pdf->set_nsi_header(false);
		$resolution = array(220 , 297);
		$pdf->AddPage('P', $resolution);

		$html = '
		<style>
			.h_tengah {text-align: center;}
			.h_kiri {text-align: left;}
			.h_kanan {text-align: right;}
			.txt_judul {font-size: 12pt; font-weight: bold; padding-bottom: 12px;}
			.header_kolom {background-color: #cccccc; text-align: center; font-weight: bold;}
			.txt_content {font-size: 7pt; text-align: center;}
			
		</style>';
		$html .= ''.$pdf->nsi_box($text ='
			<table width="100%">
				<tr>
					<td colspan="2" class="h_kiri" class="txt_judul"><strong>'.$out['nama_lembaga'].'</strong>
					</td>
				</tr>
				<tr>
					<td class="h_kiri" width="100%">'.$out['alamat'].' Tel. '.$out['telepon'].'
						<hr width="100%"></td>
					</tr>
				</table>
				', $width = '100%', $spacing = '0', $padding = '1', $border = '0', $align = 'left').'';

		$anggota= $this->general_m->get_data_anggota($row->anggota_id);
		
		// $batas++;

		// 	$barang = $this->pinjaman_m->get_data_barang($r->barang_id);   
		// 	$anggota = $this->general_m->get_data_anggota($r->anggota_id);   
		// 	$jml_bayar = $this->general_m->get_jml_bayar($r->id); 
		// 	$jml_denda = $this->general_m->get_jml_denda($r->id); 
		// 	$jml_tagihan = $r->tagihan + $jml_denda->total_denda;
		// 	$sisa_tagihan = $jml_tagihan - $jml_bayar->total;


		// 	//total pinjaman
		// 	$total_pinjaman += @$r->jumlah;
		// 	//total tagihan
		// 	$total_tagihan += $jml_tagihan;
		// 	//total dibayar
		// 	$tot_sdh_dibayar += $jml_bayar->total;
		// 	//sisa tagihan
		// 	$tot_sisa_tagihan += $sisa_tagihan;

		// 	//jabatan
		// 	if ($anggota->jabatan_id == "1"){
		// 		$jabatan = "Pengurus";
		// 	} else {
		// 		$jabatan = "Anggota";
		// 	}

		// 	//jk
		// 	if ($anggota->jk == "L"){
		// 		$jk = "Laki-laki";
		// 	} else {
		// 		$jk = "Perempuan";
		// 	}

		// 	$tgl_pinjam = explode(' ', $r->tgl_pinjam);
		// 	$txt_tanggal = jin_date_ina($tgl_pinjam[0],'full');

		// 	$tgl_tempo = explode(' ', $r->tempo);
		// 	$txt_tempo = jin_date_ina($tgl_tempo[0],'full');

			$anggota = $this->general_m->get_data_anggota($row->anggota_id);
			$angsuran = $this->angsuran_m->get_data_angsuran($row->id);

			$hitung_denda = $this->general_m->get_jml_denda($row->id);
			$hitung_dibayar = $this->general_m->get_jml_bayar($row->id);
			$sisa_ags = $this->general_m->get_record_bayar($row->id);
			$angsuran = $this->angsuran_m->get_data_angsuran($row->id);

		// $offset = isset($_POST['page']) ? intval($_POST['page']) : 1;
		// $limit  = isset($_POST['rows']) ? intval($_POST['rows']) : 10;
		// $sort  = isset($_POST['sort']) ? $_POST['sort'] : 'tgl_pinjam';
		// $order  = isset($_POST['order']) ? $_POST['order'] : 'desc';
		// $kode_transaksi = isset($_POST['kode_transaksi']) ? $_POST['kode_transaksi'] : '';
		// $cari_status = isset($_POST['cari_status']) ? $_POST['cari_status'] : '';
		// $cari_nama = isset($_POST['cari_nama']) ? $_POST['cari_nama'] : '';
		// $tgl_dari = isset($_POST['tgl_dari']) ? $_POST['tgl_dari'] : '';
		// $tgl_sampai = isset($_POST['tgl_sampai']) ? $_POST['tgl_sampai'] : '';
		// $search = array('kode_transaksi' => $kode_transaksi, 
		// 	'cari_status' => $cari_status,
		// 	'cari_nama' => $cari_nama,
		// 	'tgl_dari' => $tgl_dari, 
		// 	'tgl_sampai' => $tgl_sampai);
		// $offset = ($offset-1)*$limit;
		// $data   = $this->pinjaman_m->get_data_transaksi_ajax($offset,$limit,$search,$sort,$order);
		// $i	= 0;

			// $tgl_bayar = explode(' ', $row->tgl_pinjam);
			// $txt_tanggal = jin_date_ina($tgl_bayar[0]);   

			// $tgl_tempo = explode(' ', $row->tempo);
			// $tgl_tempo = jin_date_ina($tgl_tempo[0]); 

		foreach
			

		
		$data_pinjam  = $this->pinjaman_m->get_data_pinjam($id);
		$rr = $this->general_m->get_data_anggota($id);

		$tgl_input = explode(' ', $row->tgl_input);
		$txt_tanggal = jin_date_ina($tgl_input[0]);

		$tgl_cair = explode(' ', $row->tgl_cair);
		$tgl_cair = jin_date_ina($tgl_cair[0]);

		$status_arr = array(0 => 'Menunggu Konfirmasi', 1 => 'Disetujui', 2 => 'Ditolak', 3 => 'Sudah Terlaksana', 4 => 'Batal');
		
		$html .='<div class="h_tengah"><strong>HAK DAN KEWAJIBAN </strong> <br> Ref. '.date('Ymd_His').'</div>

		<table width="100%" cellspacing="0" cellpadding="1" border="1">
		<tr>
		<th colspan="2"><span style="font-size: 12px;"><strong>Identitas Anggota </strong></span> </th>
		</tr>
			<tr>
				<td> nomor kontrak </td>
		
				<td>'.'SP'.sprintf('%05d', $row->id).'</td>
			
			</tr>
			<tr>
				<td> id anggota </td>
	
				<td>'.$row->identitas.'</td>

			</tr>
			<tr>
				<td> anggota </td>

				<td>'.$anggota->nama.'</td>
				
			</tr>

			<tr>
				<td> departement </td>
	
				<td>'.$row->departement.'</td>
			
			</tr>
			<tr>
				<td> alamat </td>
				
				<td>'.$anggota->alamat.'</td>
				
			</tr>
			
			</table>
			 
			<br>
		<table width="100%" cellspacing="0" cellpadding="1" border="1">
		<tr>
		<th colspan="2"><span style="font-size: 12px;"><strong>Simpanan</strong></span> </th>
		</tr>
			<tr>
				<td> kode transaksi </td>
		
				<td>'.'TSP'.sprintf('%05d', $row->id).'</td>
			
			</tr>
			
			
			<tr>
				<td> sskb </td>
				
				<td></td>
				
			</tr>
			<tr>
				<td> swk </td>
				
				<td></td>
				
			</tr>

			<tr>
				<td> jasa sskb </td>

				<td></td>
				
			</tr>

			<tr>
				<td> simpanan deviden</td>
	
				<td></td>
				
			</tr>

			<tr>
				<td> kas sukarela</td>
		
				<td></td>
				
			</tr>

			</table>
			<table width="100%" border="1">';
					$simpanan_arr = array();
					$simpanan_row_total = 0; 
					foreach ($data_jns_simpanan as $jenis) {
						$simpanan_arr[$jenis->id] = $jenis->jns_simpan;
						$nilai_s = $this->lap_kas_anggota_m->get_jml_simpanan($jenis->id, $row->id);
						$nilai_p = $this->lap_kas_anggota_m->get_jml_penarikan($jenis->id, $row->id);	
						$simpanan_row=$nilai_s->jml_total - $nilai_p->jml_total;
						$simpanan_row_total += $simpanan_row;
		$html.=' <tr>
						<td> '.$jenis->jns_simpan.'</td>
						<td class="h_kiri"> '. number_format($simpanan_row).'</td>
					</tr>';
					}
		$html.='<tr>
						<td> <strong>Total Simpanan</strong></td>
						<td class="h_kiri"><strong> '.number_format($simpanan_row_total).'</strong></td>
					</tr>
					</table>
		
			
			<table width="100%" cellspacing="0" cellpadding="1" border="1">
			<tr>
				<th colspan="7"><br><br> <span style="font-size: 12px;"><strong>Pinjaman</strong></span> </th>
			</tr>
			<tr>
				<th> Kode Pinjam </th>
				<th> Jenis Pinjaman </th>
                <th> Poko pinjam </th>
                <th> Cicilan </th>
                <th> Angsuran Ke- </th>
                <th> Sisa Poko </th>
                <th> Sisa Jasa </th>
			</tr>
			<tr>
				<td>'.'TPJ'.sprintf('%05d', $row->id).'</td>
				<td>'.$row->jenis.'</td>
				<td>'.$row->nominal.'</td>
				<td>'.$row->lama_ags.'</td>
				<td>'.$row->lama_ags.'</td>
				<td></td>
				<td></td>
			</tr>
        </table>
		<br><br>
		
		TERBILANG = '.$this->terbilang->eja(nsi_round($row->nominal)).' RUPIAH
		<p></p>
		<table width="90%">
			<tr>
				<td height="50px"></td>
				<td class="h_tengah">'.$out['kota'].', '.jin_date_ina(date('Y-m-d')).'</td>
			</tr>
			<tr>
				<td class="h_tengah"> '.strtoupper($this->data['u_name']).'</td>
				<td class="h_tengah">'.strtoupper($anggota->nama).'</td>
			</tr>
		</table>';


		


		


		
		$pdf->nsi_html($html);
		$pdf->Output(date('Ymd_His') . '.pdf', 'I');
	} 
}