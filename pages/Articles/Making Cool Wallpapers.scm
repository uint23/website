(home-h2 "Making Cool Wallpapers")

(p
  (italic "Last Updated: 16/07/2026"))

(blockquote
  "Some of my explanations may be confusing. "
  "Play around to see what I'm talking about!")

(image "/Images/MakingCoolWallpapers/TopCollage.png"
  alt: "Wallpaper collage")

(p
  "Many people have asked me, over the time I've been posting my computer setup, "
  "how they too can replicate the \"bi/tri-chrome\" wallpaper aesthetic that many of "
  "my wallpapers achieve. Here I will spill my secrets.")

(blockquote
  "If you would rather me do it, I do take commissions, just "
  (link "mailto:unsigned@netcat.uk" "email me")
  " ;)")

(h3 "The Editor")

(p
  "The image editing software I use for making these wallpapers is "
  (link "https://photopea.com" "Photopea")
  ". It's a fantastic web-based replacement for Photoshop (trying to be 1:1!). "
  "While other editors like Krita or Gimp may work, I don't know how to use them "
  "and will be referencing Photopea, so you'll have to try to \"translate\" what "
  "I'm doing to your editor of choice.")

(h3 "Gathering Materials")

(p
  "Firstly, you have to decide: what sort of image you want to make and your color pallete.")

(p
  "For images, I just look to what interests me or looks cool. For this example, "
  "I'll use a random cat image. You may also want a collage of images. "
  (link "#preparing-images-separately" "See here")
  " for preparing these images separately and why you may want to do so.")

(p
  "For the color pallete, I personally used to just eyeball it and experiment "
  "until I found something which looks good. By now, I've gotten decent at it but "
  "I highly suggest "
  (link "https://lospec.com/palette-list" "the Lospec pallete list")
  ". It has so many cool schemes which I will definately use sometime later.")

(p
  "You should now create a new image in Photopea in the dimensions of your screen. "
  "For me, it's 1280x1024 or 1024x768 (because thats what I use on my monitors).")

(h3 "The Technique")

(p
  "There are two ways I get that sharp-edged, bi-chromed look that I know of:")

(h4 "PNG Compression")

(image "/Images/MakingCoolWallpapers/ExportingPNG.png"
  alt: "Photopea PNG export dialog")

(p
  "If you paste an image into your canvas and try export it as PNG "
  (italic "([File > Export as > PNG] or [Ctrl + Alt + Shift + S])")
  ", you can see a slider for the "
  (italic "Quality")
  ". Setting it to 0% will show you an image which is very sharp; there are only "
  "2 colors in the pallete. Turning this slider up, you can see more color being "
  "restored to the image--I usually keep between 0-2%. The reason we only use PNGs "
  "(or GIFs) is because the color pallete gets reduced; at 0%, every color gets quantized.")

(image "/Images/MakingCoolWallpapers/PNGCompare.png"
  alt: "PNG quality comparison")

(h4 "Note Paper Filter")

(image "/Images/MakingCoolWallpapers/ExportingNotePaper.png"
  alt: "Photopea Note Paper filter")

(p
  (bold "While selecting the image layer")
  ", you can do "
  (italic "[Filter > Filter Gallery... > Note Paper]")
  " then reduce the "
  (italic "Relief")
  " and "
  (italic "Graininess")
  " to 0. This will leave you with a similarly, bi-chromic, sharp image. "
  "Play around and adjust the slider to see how the image reacts.")

(blockquote
  "After applying this filter, you may still notice blurry edges on your image "
  "if it had transparency. That is because this filter preserves the alpha. To "
  "fix this, simply paint bucket over the two colors. This will reset their alpha "
  "to that of the color (should be 255). "
  (link "#the-paint-bucket-tool" "See The Paint Bucket Tool")
  ".")

(image "/Images/MakingCoolWallpapers/NotePaperCompare.png"
  alt: "Note Paper filter comparison")

(anchor "the-paint-bucket-tool")
(h3 "The Paint Bucket Tool")

(image "/Images/MakingCoolWallpapers/PaintBucketBar.png"
  alt: "Photopea paint bucket toolbar")

(p
  "You now have your image, but what if you don't like the colors? By pressing the "
  "paintbucket icon, or "
  (italic "G")
  ", you can access the paint bucket tool. Try copying the options from the image "
  "above. "
  (bold "Tolerance")
  " is how much leeway the tool has. If this is a value greater than 0, you may "
  "find similar but different colors being painted the same. "
  (bold "Anti-alias")
  " should be disabled. It can add a blurring look when you're painting a certain "
  "color. "
  (bold "Contiguous")
  " is usually disabled for me as it won't paint any color if it's cut off.")

(p
  "Now you have it set up, simply select a color from the Color Picker and click "
  "the color you want to replace.")

(h3 "Resizing Images")

(p
  "You may find if you resize your image, it gets blurry. To resolve this, resize "
  "your image but at the top where it says "
  (italic "Bilinear")
  ", set that to "
  (italic "Nearest Neighbor")
  "; this will give you pixel perfect resizing.")

(h3 "Dealing With Smart Objects")

(p
  "When putting an image in, it may be a "
  (italic "Smart Object")
  ". When scaling these images, they won't have an option to scale using "
  (italic "Nearest Neighbor")
  ". To solve this, double click the image, click then drag the layer with the "
  "image on into the main tab. You can now delete the "
  (italic "Smart Object")
  " image.")

(p "While they can be very useful, I won't cover it in this article.")

(h3 "Getting Rid of Backgrounds")

(p
  "Great! We now have our cat image in that nice and crisp format but how about "
  "the background? In order to get rid of it, there are two ways I like to do it.")

(h4 "Magic Wand")

(p
  "You will need to get the original image first, ideally in the original "
  "resolution too for better results. Click the wand icon or press "
  (italic "W")
  ".")

(p
  "The "
  (italic "Anti-alias")
  " option can be enabled (unless you are working with a low-res image).")

(p
  "For our image, however, this method doesn't work well as the background is very "
  "diverse, having a floor, trees and sky.")

(p
  "A good usecase is for removing the background of fake-transparent or "
  "white background images, which you may want to collage into your image.")

(image "/Images/MakingCoolWallpapers/FakeImage.png"
  alt: "Fake transparent image")

(blockquote
  "Another way is exporting the image with a ~2% quality then removing the "
  "background colors then re-exporting it, but that almost always more effort.")

(h4 "Eraser + Magic Wand")

(p
  "This method may take a bit longer but works really well. Firstly, prepare your "
  "image at the quality level you want (I'll use 0%). Then set "
  (bold "Anti-alias")
  " to off, "
  (bold "Tolerance")
  " 0 and "
  (bold "Contiguous")
  " to on. Now select the background and while holding "
  (italic "Shift")
  ", select any areas which haven't been selected. If it bleeds into the subject, "
  "find the part where the image which has a hole and color it in. To color, "
  "select the "
  (italic "Brush Tool")
  " or press "
  (italic "B")
  ", right click and set to "
  (italic "Pencil")
  ".")

(image "/Images/MakingCoolWallpapers/EraserBar.png"
  alt: "Photopea eraser toolbar")

(p
  "Now you can erase. Select the "
  (italic "Erasor Tool")
  " or press "
  (italic "E")
  " and set it to "
  (italic "Pencil")
  " mode. Now you can erase away until you have just the subject left!")

(image "/Images/MakingCoolWallpapers/RemovedBackground.png"
  alt: "Image with background removed")

(anchor "preparing-images-separately")
(h3 "Preparing Images Separately")

(p
  "Sometimes, we may want more than 1 image with their own palletes in a mix. "
  "Just carry out the pevious processes but individually, then collage them into one.")

(h3 "Text")

(p
  "You may want some inspirational quote or whatever on your wallpaper. To do this "
  (italic "and")
  " fit the aesthetic, select the text tool, find a serif font (I personally like "
  "Instrument Serif or one of the *Tex fonts), write your message.")

(p
  "Now select it all and set the "
  (italic "Aa")
  " to "
  (italic "None")
  ".")

(image "/Images/MakingCoolWallpapers/NoAAText.png"
  alt: "Photopea text antialias setting")

(h3 "The Final Image")

(p
  "Now simply create a new layer and paint it whatever color you want and layer "
  "your image(s) on top!")

(image "/Images/MakingCoolWallpapers/Final.png"
  alt: "Final wallpaper")
