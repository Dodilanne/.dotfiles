echo "Setting up Rectangle..."

defaults write com.knollsoft.Rectangle specified -dict-add keyCode -float 32 modifierFlags -float 917795
defaults write com.knollsoft.Rectangle specifiedWidth -float 0.60
defaults write com.knollsoft.Rectangle specifiedHeight -float 0.90

defaults write com.knollsoft.Rectangle screenEdgeGapTop -int 0
defaults write com.knollsoft.Rectangle screenEdgeGapBottom -int 0
defaults write com.knollsoft.Rectangle screenEdgeGapLeft -int 0
defaults write com.knollsoft.Rectangle screenEdgeGapRight -int 0

defaults write com.knollsoft.Rectangle snapEdgeMarginTop -int 0
defaults write com.knollsoft.Rectangle snapEdgeMarginBottom -int 0
defaults write com.knollsoft.Rectangle snapEdgeMarginLeft -int 0
defaults write com.knollsoft.Rectangle snapEdgeMarginRight -int 0

echo "Done."
