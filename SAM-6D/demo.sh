export CAD_PATH=Data/Example/obj_000005.ply
export RGB_PATH=Data/Example/rgb.png
export DEPTH_PATH=Data/Example/depth.png
export CAMERA_PATH=Data/Example/camera.json
export OUTPUT_DIR=Data/Example/outputs

# Render CAD templates
blenderproc run Render/render_custom_templates.py --output_dir $OUTPUT_DIR --cad_path $CAD_PATH #--colorize True 

# Run instance segmentation model
export SEGMENTOR_MODEL=sam

cd ./Instance_Segmentation_Model
python run_inference_custom.py --segmentor_model $SEGMENTOR_MODEL --output_dir $OUTPUT_DIR --cad_path $CAD_PATH --rgb_path $RGB_PATH --depth_path $DEPTH_PATH --cam_path $CAMERA_PATH


# Run pose estimation model
export SEG_PATH=$OUTPUT_DIR/sam6d_results/detection_ism.json

cd ../Pose_Estimation_Model
python run_inference_custom.py --output_dir $OUTPUT_DIR --cad_path $CAD_PATH --rgb_path $RGB_PATH --depth_path $DEPTH_PATH --cam_path $CAMERA_PATH --seg_path $SEG_PATH

