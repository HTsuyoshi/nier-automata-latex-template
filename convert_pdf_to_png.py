import fitz # PyMuPDF, imported as fitz for backward compatibility reasons
file_path = './Template___Nier_Automata.pdf'
doc = fitz.open(file_path)  # open document
for i, page in enumerate(doc):
    pix = page.get_pixmap()
    pix.save(f'pages/page_{i}.png')

from PIL import Image

images = []

for i in range(19):
    img = Image.open(f'pages/page_{i}.png')
    images.append(img)

width, height = images[0].size
output_image = Image.new('RGB', (width * 5, height * 4))

for i in range(4):
    for j in range(5):
        if 5*i+j < len(images):
            output_image.paste(images[5*i+j], (width * j, height * i))

output_image.save('output.png')
