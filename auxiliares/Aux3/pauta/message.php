

Estimado <?php echo $_POST['nombre']; ?>,
<br>
Su pedido de una pizza con <?php if ($_POST['masa'] == 1) { echo "masa delgada"; }  else { echo "masa normal"; } ?> e ingrediente   
<?php if ($_POST['ingrediente'] == 1) { echo "pepperoni"; }  else if ($_POST['ingrediente'] == 1) {echo "aceitunas"; } else { echo "carne"; } ?>
llegará a la dirección <?php echo $_POST['direccion']; ?>, comuna de <?php if ($_POST['comuna'] == 1) { echo "Santiago"; }  else if ($_POST['ingrediente'] == 1010) {echo "Providencia"; } else { echo "Recoleta"; } ?> 
en 30 minutos. Ante cualquier inconveniente le pedimos estar atento a su celular <?php echo $_POST['telefono']; ?> para solicitar indicaciones.