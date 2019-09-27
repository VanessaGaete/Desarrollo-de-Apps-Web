$(document).ready(function() {

    $("#categoria").change(function() {
        var val = $(this).val();
        if (val == "1"||val == "2"||val == "3") {
            $("#size").html("<option value=''>-- seleccione talla --</option><option value='test'>0 meses</option><option value='test2'>3 meses</option><option value='test'>6 meses</option><option value='test'>12 meses</option><option value='test'>2-3 años</option><option value='test'>4-5 años</option><option value='test'>6-7 años</option><option value='test'>8-9 años</option><option value='test'>10-11 años</option><option value='test'>12-14 años</option>");
        } else if(val == "4"||val == "5"||val == "6") {
            $("#size").html("<option value=''>-- seleccione talla --</option><option value='test'>XS</option><option value='test2'>S</option><option value='test2'>M</option><option value='test2'>L</option><option value='test2'>XL</option><option value='test2'>XXL</option>");
        }
    });


});



