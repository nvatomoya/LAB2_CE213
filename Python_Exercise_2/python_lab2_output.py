import numpy as np
import cv2

def txt_to_grayscale_image(input_txt_path, output_image_path, width=2048, height=1365):
    try:
        with open(input_txt_path, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Không tìm thấy file '{input_txt_path}'!")
        return

    pixel_values = []
    for line in lines:
        line = line.strip()
        if line:
            pixel_values.append(int(line, 16)) 

    expected_pixels = width * height
    actual_pixels = len(pixel_values)
    
    if actual_pixels != expected_pixels:
        print(f"Cảnh báo: Số lượng pixel ({actual_pixels}) không khớp với kích thước ({width}x{height} = {expected_pixels}).")
        return

    image_array_1d = np.array(pixel_values, dtype=np.uint8)
    image_2d = image_array_1d.reshape((height, width))

    cv2.imwrite(output_image_path, image_2d)
    print(f"Tuyệt vời! Đã lưu ảnh thành công tại: '{output_image_path}'")

    cv2.imshow('Grayscale Output from Verilog', image_2d)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

txt_to_grayscale_image('output.txt', 'result_grayscale.bmp', width=2048, height=1365)