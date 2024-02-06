<?php
if(isset($_FILES['image'])){
    // File path configuration
    $targetDir = "uploads/";
    $fileName = basename($_FILES["image"]["name"]);
    $targetFilePath = $targetDir . $fileName;
    $fileType = pathinfo($targetFilePath,PATHINFO_EXTENSION);
    
    $allowTypes = array('jpg','png','jpeg','gif');
    if(in_array($fileType, $allowTypes))
        if(move_uploaded_file($_FILES["image"]["tmp_name"], $targetFilePath)){
            echo json_encode(array('status' => 'success', 'message' => 'Image uploaded successfully.', 'path' => $targetFilePath));
        }else{
            echo json_encode(array('status' => 'error', 'message' => 'Error uploading image.'));
        }
    }else{
        echo json_encode(array('status' => 'error', 'message' => 'Only JPG, JPEG, PNG, GIF files are allowed.'));
    }
}
?>
ss
