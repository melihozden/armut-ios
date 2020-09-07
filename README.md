<div>
    <img align="center" src="https://www.halklailiskiler.com/resim/800/600/1472106857-ArmutLogo_1472205423.png" width= "200px" height= "150px"/>
</div>

## Armut IOS Project

Armut.com ios developer hiring project

## Bonus

### Optimizing Image Loading
  In IOS apps, loading images pass through 3 steps
  1) Loading : iOS takes images in compressed forms and loads into memory 
  2) Decode  : In Decode step, iOS converts the images into way the GPU can read and understand in uncompressed state. 
  3) Render  : Last step, image data is ready to use, and tend to rendered any which way. Even if our image very small dimensions. 

  In IOS Apps, we need to get actual image source wihtout cropping them. For example, if you have 1000 x 1500 pixels image, we shouldn't assign lower anchors to this image.
  All we need to do compress image or reduce to size of image and use it that way.
 
 
## Errors & Bugs 
  PostControler.swift -> Scrolling doesn't work.
  
