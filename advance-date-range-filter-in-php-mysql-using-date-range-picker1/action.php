<?php

//action.php

$connect = new PDO("mysql:host=localhost;dbname=dw_adventureworks", "root", "");


if(isset($_POST["action"]))
{
	if($_POST["action"] == 'fetch')
	{
		// $order_column = array('vendor_name', 'total_due', 'time_id');

		$main_query = "
		SELECT vendor_name, SUM(total_due) AS total_due, time_id 
		FROM vchart 
		";

		$search_query = 'WHERE time_id <= "'.date('Y-m-d').'" AND ';

		if(isset($_POST["start_date"], $_POST["end_date"]) && $_POST["start_date"] != '' && $_POST["end_date"] != '')
		{
			$search_query .= 'time_id >= "'.$_POST["start_date"].'" AND time_id <= "'.$_POST["end_date"].'" AND ';
		}

		if(isset($_POST["search"]["value"]))
		{
			$search_query .= '(vendor_name LIKE "%'.$_POST["search"]["value"].'%" OR total_due LIKE "%'.$_POST["search"]["value"].'%" OR time_id LIKE "%'.$_POST["search"]["value"].'%")';
		}



		$group_by_query = " GROUP BY time_id ";

		$order_by_query = "";

		if(isset($_POST["order"]))
		{
			$order_by_query = 'ORDER BY '.$order_column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
			$order_by_query = 'ORDER BY time_id DESC ';
		}

		$limit_query = '';

		if($_POST["length"] != -1)
		{
			$limit_query = 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}

		$statement = $connect->prepare($main_query . $search_query . $group_by_query . $order_by_query);

		$statement->execute();

		$filtered_rows = $statement->rowCount();

		$statement = $connect->prepare($main_query . $group_by_query);

		$statement->execute();

		$total_rows = $statement->rowCount();

		$result = $connect->query($main_query . $search_query . $group_by_query . $order_by_query . $limit_query, PDO::FETCH_ASSOC);

		$data = array();

		foreach($result as $row)
		{
			$sub_array = array();

			$sub_array[] = $row['vendor_name'];

			$sub_array[] = $row['total_due'];

			$sub_array[] = $row['time_id'];

			$data[] = $sub_array;
		}

		$output = array(
			"draw"			=>	intval($_POST["draw"]),
			"recordsTotal"	=>	$total_rows,
			"recordsFiltered" => $filtered_rows,
			"data"			=>	$data
		);

		echo json_encode($output);
	}
}

?>