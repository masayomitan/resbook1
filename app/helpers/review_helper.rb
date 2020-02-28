module ReviewHelper
  def raty_stars(n, max=5)
    (
      image_tag('raty/star-on.png', alt: '') * n +
      image_tag('raty/star-off.png', alt: '') * (max-n)
      ).html_safe
  end
end
