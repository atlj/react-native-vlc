package com.vlc

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.VlcViewManagerInterface
import com.facebook.react.viewmanagers.VlcViewManagerDelegate

@ReactModule(name = VlcViewManager.NAME)
class VlcViewManager : SimpleViewManager<VlcView>(),
  VlcViewManagerInterface<VlcView> {
  private val mDelegate: ViewManagerDelegate<VlcView>

  init {
    mDelegate = VlcViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<VlcView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): VlcView {
    return VlcView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: VlcView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "VlcView"
  }
}
