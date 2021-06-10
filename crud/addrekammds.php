<?php

include 'conn.php';

$no_rm = $_POST['no_rm'];
$keluhan = $_POST['keluhan'];
$id_dokter = $_POST['id_dokter'];
$diagnosa = $_POST['diagnosa'];
$id_unit = $_POST['id_unit'];
$tgl_periksa = $_POST['tgl_periksa'];
$id_resep = $_POST['id_resep'];


$connect->query("INSERT INTO rekammds (keluhan,id_dokter,diagnosa,id_unit,tgl_periksa,id_resep) VALUES ('".$no_rm."','".$keluhan."','".$id_dokter."','".$diagnosa."','".$id_unit."','".$tgl_periksa."','".$id_resep."') ")

?>