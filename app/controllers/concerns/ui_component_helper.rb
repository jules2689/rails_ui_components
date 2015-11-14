module UiComponentHelper

  HEADERS = %w( h1 h2 h3 h4 h5 h6 )
  TEXT = %w( p span )
  TABLE = %w( table thead tr td tbody th )
  BLOCK = %w( div )
  LIST = %w( ul ol dl li )
  CODE = %w( code pre section kbd var samp )
  FIGURE = %w( figure figcaption )
  MISC = %w( attr button )
  ALL_ELEMENTS = [HEADERS, TEXT, TABLE, BLOCK, CODE, LIST, MISC].flatten.freeze

  ALL_ELEMENTS.each do |element|

    define_method element do |*args, &block|
      options = args.first
      content_tag element, options do
        block.call if block
      end
    end

  end

  def image(classes:, src:, alt:, &block)
    content_tag :img, 'src' => src, 'class' => classes, 'alt' => alt do
      block.call if block
    end
  end

  def call_super(method, classes, &block)
    ::UiComponentHelper.instance_method(method).bind(self).call(class: classes, &block)
  end

end 

