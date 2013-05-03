# MAML

Maml (rubyMotion HAML) lets you create UI elements using a haml-style tag#id.class_name syntax. Maml is best-friends-forever with the Pixate engine.

Maml (rubyMotion HAML) allows you to create UI elements with Haml syntax.

```ruby
label = UI("label#buy.green")

# Equivalent to
label = UILabel.alloc.init
label.styleId = "buy"
label.styleClass = "green"
```

It accepts a hash of attributes that will be assigned to the element.

```ruby
UI("label#buy", :frame => [[0,0],[100,0]], :text => "Hello")
```

## Installation

Install gem

    gem install motion-maml

In Gemfile

    gem "motion-maml", '~> 0.1.1'


## Supported elements

```ruby
{
  'action-sheet'    => UIActionSheet,
  'activity-indicator-view' => UIActivityIndicatorView,
  'bar-button-item' => UIBarButtonItem,
  'button'          => UIButton,
  'collection-view' => UICollectionView,
  'collection-view-cell' => UICollectionViewCell,
  'date-picker'     => UIDatePicker,
  'image-view'      => UIImageView,
  'label'           => UILabel,
  'navigation-bar'  => UINavigationBar,
  'page-control'    => UIPageControl,
  'picker-view'     => UIPickerView,
  'refresh-control' => UIRefreshControl,
  'scroll-view'     => UIScrollView,
  'search-bar'      => UISearchBar,
  'segmented-control' => UISegmentedControl,
  'slider'          => UISlider,
  'stepper'         => UIStepper,
  'switch'          => UISwitch,
  'tab-bar'         => UITabBar,
  'tab-bar-item'    => UITabBarItem,
  'progress-view'   => UIProgressView,
  'table-view'      => UITableView,
  'table-view-headerfooter-view' => UITableViewHeaderFooterView,
  'text-field'      => UITextField,
  'text-view'       => UITextView,
  'toolbar'         => UIToolbar,
  'view'            => UIView,
  'web-view'        => UIWebView,
  'table-view-cell' => UITableViewCell
}
```