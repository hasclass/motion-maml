module Maml
  # struct used by #parse
  Tag = Struct.new(:element, :id, :class_name)

  DEFAULT_TAG  = 'view'.freeze

  TAGS      = {
    # 'annotation-view' => ::MKAnnotationView,
    # 'map-view'        => ::MKMapView,
    # 'volume-view'     => ::MPVolumeView,
    'action-sheet'    => ::UIActionSheet,
    'activity-indicator-view' => ::UIActivityIndicatorView,
    'bar-button-item' => ::UIBarButtonItem,
    'button'          => ::UIButton,
    'collection-view' => ::UICollectionView,
    'collection-view-cell' => ::UICollectionViewCell,
    'date-picker'     => ::UIDatePicker,
    'image-view'      => ::UIImageView,
    'label'           => ::UILabel,
    'navigation-bar'  => ::UINavigationBar,
    'page-control'    => ::UIPageControl,
    'picker-view'     => ::UIPickerView,
    'refresh-control' => ::UIRefreshControl,
    'scroll-view'     => ::UIScrollView,
    'search-bar'      => ::UISearchBar,
    'segmented-control' => ::UISegmentedControl,
    'slider'          => ::UISlider,
    'stepper'         => ::UIStepper,
    'switch'          => ::UISwitch,
    'tab-bar'         => ::UITabBar,
    'tab-bar-item'    => ::UITabBarItem,
    'progress-view'   => ::UIProgressView,
    'table-view'      => ::UITableView,
    'table-view-headerfooter-view' => ::UITableViewHeaderFooterView,
    'text-field'      => ::UITextField,
    'text-view'       => ::UITextView,
    'toolbar'         => ::UIToolbar,
    'view'            => ::UIView,
    'web-view'        => ::UIWebView,
    'table-view-cell' => ::UITableViewCell
  }.freeze


  def alloc(selector)
    build(selector)
  end

  def init(selector, options = nil)
    element = alloc(selector).init
    options && options.each do |key, value|
      element.send("#{key}=", value)
    end
    element
  end

  def build(selector)
    tag = parse(selector)

    klass = klass_for(tag.element)
    raise "#{tag.element.inspect} not a valid tag name" unless klass

    element = klass.alloc
    element.styleId    = tag.id         if tag.id
    element.styleClass = tag.class_name if tag.class_name
    element
  end

  def klass_for(name)
    TAGS[name]
  end

  def parse(selector)
    selector = selector.to_s.strip

    rgx = /^([\w\-]+)?(#[\w\-]+)?(\.[\w\.\-]+)?/

    captures   = selector.match(rgx)

    name = captures[1] || 'view'
    name.gsub!('_', '-')

    id = captures[2]
    id.gsub!('#', '') if id

    class_name = captures[3]
    if class_name
      class_name.gsub!('.', ' ')
      class_name.strip!
    end

    Tag.new(name,  id,  class_name)
  end

  def [](selector)
    init(selector, nil)
  end

  module_function :build, :parse, :alloc, :[], :init, :klass_for

end