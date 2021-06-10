<?php
include 'conn.php';

$no_rm = $_POST['no_rm'];
$keluhan = $_POST['keluhan'];
$id_dokter = $_POST['id_dokter'];
$diagnosa = $_POST['diagnosa'];
$id_unit = $_POST['id_unit'];
$tgl_periksa = $_POST['tgl_periksa'];
$id_resep = $_POST['id_resep'];

$connect->query("UPDATE rekammds SET keluhan='".$keluhan."', id_dokter='".$id_dokter."', diagnosa='".$diagnosa."', id_unit='".$id_unit."', tgl_periksa='".$tgl_periksa."', id_resep='".$id_resep."' WHERE no_rm=".$no_rm);
?>