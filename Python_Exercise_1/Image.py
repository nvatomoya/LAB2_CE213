import numpy as np
import matplotlib.pyplot as plt
import cv2  

WIDTH_OUT = 430
HEIGHT_OUT = 554

def hex_to_image(filename, output_filename):
    data = []
    try:
        with open(filename, 'r') as f:
            for line in f:
                val_str = line.strip()
                try:
                    val = int(val_str, 16)
                    data.append(val)
                except ValueError:
                    data.append(0) 

        print(f"Tổng số pixel đọc được: {len(data)}")
        
        expected_pixels = WIDTH_OUT * HEIGHT_OUT
        if len(data) > expected_pixels:
            data = data[:expected_pixels] 
        elif len(data) < expected_pixels:
            data.extend([0] * (expected_pixels - len(data))) 

        img_array = np.array(data, dtype=np.uint8)
        img_2d = img_array.reshape((HEIGHT_OUT, WIDTH_OUT))

       
        cv2.imwrite(output_filename, img_2d)
        print(f"Đã lưu ảnh thành công: '{output_filename}'")
       

        plt.figure(figsize=(8, 10))
      
        plt.imshow(img_2d, cmap='gray', vmin=0, vmax=255) 
        plt.title("Anh sau khi loc nhiễu (Fixed)")
        plt.axis('off')
        plt.show()

    except Exception as e:
       print(f"Lỗi phát sinh: {e}")
hex_to_image('pic_output.txt', 'ket_qua_loc_nhieu.jpg')