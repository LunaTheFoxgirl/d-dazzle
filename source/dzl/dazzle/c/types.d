/*
 * This file is part of d-dazzle.
 *
 * d-dazzle is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * d-dazzle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with d-dazzle; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
module dazzle.c.types;

public import cairo.c.types;
public import gdk.c.types;
public import gio.c.types;
public import glib.c.types;
public import gobject.c.types;
public import gtk.c.types;
public import pango.c.types;


public enum DzlAnimationMode
{
	LINEAR = 0,
	EASE_IN_QUAD = 1,
	EASE_IN_OUT_QUAD = 3,
	EASE_OUT_QUAD = 2,
	EASE_IN_CUBIC = 4,
	EASE_OUT_CUBIC = 5,
	EASE_IN_OUT_CUBIC = 6,
}
alias DzlAnimationMode AnimationMode;

public enum DzlDockRevealerTransitionType
{
	NONE = 0,
	SLIDE_RIGHT = 1,
	SLIDE_LEFT = 2,
	SLIDE_UP = 3,
	SLIDE_DOWN = 4,
}
alias DzlDockRevealerTransitionType DockRevealerTransitionType;

public enum DzlFileTransferFlags
{
	NONE = 0,
	MOVE = 1,
}
alias DzlFileTransferFlags FileTransferFlags;

public enum DzlPropertiesFlags
{
	NONE = 0,
	STATEFUL_BOOLEANS = 1,
}
alias DzlPropertiesFlags PropertiesFlags;

public enum DzlShortcutMatch
{
	NONE = 0,
	EQUAL = 1,
	PARTIAL = 2,
}
alias DzlShortcutMatch ShortcutMatch;

public enum DzlShortcutPhase
{
	DISPATCH = 0,
	/**
	 * Indicates the capture phase of the shortcut
	 * activation. This allows parent widgets to intercept the keybinding before
	 * it is dispatched to the target #GdkWindow.
	 */
	CAPTURE = 1,
	BUBBLE = 2,
	GLOBAL = 4,
}
alias DzlShortcutPhase ShortcutPhase;

/**
 * DzlShortcutType specifies the kind of shortcut that is being described.
 * More values may be added to this enumeration over time.
 *
 * Since: 3.20
 */
public enum DzlShortcutType
{
	/**
	 * The shortcut is a keyboard accelerator. The #DzlShortcutsShortcut:accelerator
	 * property will be used.
	 */
	ACCELERATOR = 0,
	/**
	 * The shortcut is a pinch gesture. GTK+ provides an icon and subtitle.
	 */
	GESTURE_PINCH = 1,
	/**
	 * The shortcut is a stretch gesture. GTK+ provides an icon and subtitle.
	 */
	GESTURE_STRETCH = 2,
	/**
	 * The shortcut is a clockwise rotation gesture. GTK+ provides an icon and subtitle.
	 */
	GESTURE_ROTATE_CLOCKWISE = 3,
	/**
	 * The shortcut is a counterclockwise rotation gesture. GTK+ provides an icon and subtitle.
	 */
	GESTURE_ROTATE_COUNTERCLOCKWISE = 4,
	/**
	 * The shortcut is a two-finger swipe gesture. GTK+ provides an icon and subtitle.
	 */
	GESTURE_TWO_FINGER_SWIPE_LEFT = 5,
	/**
	 * The shortcut is a two-finger swipe gesture. GTK+ provides an icon and subtitle.
	 */
	GESTURE_TWO_FINGER_SWIPE_RIGHT = 6,
	/**
	 * The shortcut is a gesture. The #DzlShortcutsShortcut:icon property will be
	 * used.
	 */
	GESTURE = 7,
}
alias DzlShortcutType ShortcutType;

public enum DzlSliderPosition
{
	NONE = 0,
	TOP = 1,
	RIGHT = 2,
	BOTTOM = 3,
	LEFT = 4,
}
alias DzlSliderPosition SliderPosition;

public enum DzlTabStyle
{
	ICONS = 2,
	TEXT = 1,
	BOTH = 3,
}
alias DzlTabStyle TabStyle;

public enum DzlThreeGridColumn
{
	LEFT = 0,
	CENTER = 1,
	RIGHT = 2,
}
alias DzlThreeGridColumn ThreeGridColumn;

public enum DzlTreeDropPosition
{
	INTO = 0,
	BEFORE = 1,
	AFTER = 2,
}
alias DzlTreeDropPosition TreeDropPosition;

struct DzlAnimation;

struct DzlAnimationClass
{
	GObjectClass parentClass;
}

struct DzlApplication
{
	GtkApplication parentInstance;
}

struct DzlApplicationClass
{
	GtkApplicationClass parentClass;
	/** */
	extern(C) void function(DzlApplication* self, const(char)* resourcePath) addResources;
	/** */
	extern(C) void function(DzlApplication* self, const(char)* resourcePath) removeResources;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlApplicationWindow
{
	GtkApplicationWindow parentInstance;
}

struct DzlApplicationWindowClass
{
	GtkApplicationWindowClass parentClass;
	/**
	 *
	 * Params:
	 *     self = a #DzlApplicationWindow
	 * Returns: %TRUE if @self is fullscreen, otherwise %FALSE.
	 */
	extern(C) int function(DzlApplicationWindow* self) getFullscreen;
	/** */
	extern(C) void function(DzlApplicationWindow* self, int fullscreen) setFullscreen;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlBin
{
	GtkBin parentInstance;
}

struct DzlBinClass
{
	GtkBinClass parentClass;
}

struct DzlBindingGroup;

struct DzlBindingGroupClass
{
	GObjectClass parentClass;
}

struct DzlBoldingLabel;

struct DzlBoldingLabelClass
{
	GtkLabelClass parentClass;
}

struct DzlBox
{
	GtkBox parentInstance;
}

struct DzlBoxClass
{
	GtkBoxClass parentClass;
}

struct DzlBoxTheatric;

struct DzlBoxTheatricClass
{
	GObjectClass parentClass;
}

struct DzlCenteringBin
{
	GtkBin parentInstance;
}

struct DzlCenteringBinClass
{
	GtkBinClass parent;
}

struct DzlChildPropertyAction;

struct DzlChildPropertyActionClass
{
	GObjectClass parentClass;
}

struct DzlColumnLayout
{
	GtkContainer parentInstance;
}

struct DzlColumnLayoutClass
{
	GtkContainerClass parent;
}

struct DzlCounter
{
	DzlCounterValue* values;
	const(char)* category;
	const(char)* name;
	const(char)* description;
}

struct DzlCounterArena;

struct DzlCounterValue
{
	long value;
	long[7] padding;
}

struct DzlCountersWindow
{
	GtkWindow parentInstance;
}

struct DzlCountersWindowClass
{
	GtkWindowClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlCpuGraph;

struct DzlCpuGraphClass
{
	DzlGraphViewClass parentClass;
}

struct DzlCpuModel;

struct DzlCpuModelClass
{
	DzlGraphModelClass parentClass;
}

struct DzlCssProvider;

struct DzlCssProviderClass
{
	GtkCssProviderClass parentClass;
}

struct DzlDirectoryModel;

struct DzlDirectoryModelClass
{
	GObjectClass parentClass;
}

struct DzlDirectoryReaper;

struct DzlDirectoryReaperClass
{
	GObjectClass parentClass;
}

struct DzlDock;

struct DzlDockBin
{
	GtkContainer parentInstance;
}

struct DzlDockBinClass
{
	GtkContainerClass parent;
	/** */
	extern(C) GtkWidget* function(DzlDockBin* self, GtkPositionType edge) createEdge;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlDockBinEdge
{
	DzlDockRevealer parentInstance;
}

struct DzlDockBinEdgeClass
{
	DzlDockRevealerClass parent;
	/** */
	extern(C) void function(DzlDockBinEdge* self) moveToBinChild;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlDockInterface
{
	GTypeInterface parent;
}

struct DzlDockItem;

struct DzlDockItemInterface
{
	GTypeInterface parent;
	/** */
	extern(C) void function(DzlDockItem* self, DzlDockManager* manager) setManager;
	/**
	 *
	 * Params:
	 *     self = A #DzlDockItem
	 * Returns: A #DzlDockmanager.
	 */
	extern(C) DzlDockManager* function(DzlDockItem* self) getManager;
	/** */
	extern(C) void function(DzlDockItem* self, DzlDockManager* oldManager) managerSet;
	/** */
	extern(C) void function(DzlDockItem* self, DzlDockItem* child) presentChild;
	/** */
	extern(C) void function(DzlDockItem* self) updateVisibility;
	/** */
	extern(C) int function(DzlDockItem* self, DzlDockItem* child) getChildVisible;
	/** */
	extern(C) void function(DzlDockItem* self, DzlDockItem* child, int childVisible) setChildVisible;
	/**
	 *
	 * Params:
	 *     self = A #DzlDockItem
	 * Returns: A newly allocated string or %NULL.
	 */
	extern(C) char* function(DzlDockItem* self) getTitle;
	/**
	 *
	 * Params:
	 *     self = A #DzlDockItem
	 * Returns: A newly allocated string or %NULL.
	 */
	extern(C) char* function(DzlDockItem* self) getIconName;
	/**
	 *
	 * Params:
	 *     self = a #DzlDockItem
	 * Returns: %TRUE if the dock item can be closed by the user, otherwise %FALSE.
	 */
	extern(C) int function(DzlDockItem* self) getCanClose;
	/**
	 *
	 * Params:
	 *     self = a #DzlDockItem
	 * Returns: %TRUE if the widget can be minimized.
	 */
	extern(C) int function(DzlDockItem* self, DzlDockItem* descendant) canMinimize;
	/**
	 *
	 * Params:
	 *     self = a #DzlDockItem
	 * Returns: %TRUE if the dock item was closed
	 */
	extern(C) int function(DzlDockItem* self) close;
	/**
	 *
	 * Params:
	 *     self = a #DzlDockItem
	 *     child = A #DzlDockItem that is a child of @self
	 *     position = A location for a #GtkPositionType
	 * Returns: %TRUE if @child was minimized. Otherwise %FALSE and @position
	 *     may be updated to a suggested position.
	 */
	extern(C) int function(DzlDockItem* self, DzlDockItem* child, GtkPositionType* position) minimize;
	/** */
	extern(C) void function(DzlDockItem* self, DzlDockItem* child) release;
	/** */
	extern(C) void function(DzlDockItem* self) presented;
	/**
	 *
	 * Params:
	 *     self = a #DzlDockItem
	 * Returns: a #GIcon or %NULL
	 */
	extern(C) GIcon* function(DzlDockItem* self) refGicon;
	/** */
	extern(C) void function(DzlDockItem* self) needsAttention;
}

struct DzlDockManager
{
	GObject parentInstance;
}

struct DzlDockManagerClass
{
	GObjectClass parent;
	/** */
	extern(C) void function(DzlDockManager* self, DzlDock* dock) registerDock;
	/** */
	extern(C) void function(DzlDockManager* self, DzlDock* dock) unregisterDock;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlDockOverlay
{
	GtkEventBox parentInstance;
}

struct DzlDockOverlayClass
{
	GtkEventBoxClass parent;
	/** */
	extern(C) void function(DzlDockOverlay* self) hideEdges;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlDockOverlayEdge;

struct DzlDockOverlayEdgeClass
{
	DzlBinClass parentClass;
}

struct DzlDockPaned
{
	DzlMultiPaned parentInstance;
}

struct DzlDockPanedClass
{
	DzlMultiPanedClass parent;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlDockRevealer
{
	DzlBin parentInstance;
}

struct DzlDockRevealerClass
{
	DzlBinClass parent;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlDockStack
{
	GtkBox parentInstance;
}

struct DzlDockStackClass
{
	GtkBoxClass parent;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlDockTransientGrab;

struct DzlDockTransientGrabClass
{
	GObjectClass parentClass;
}

struct DzlDockWidget
{
	DzlBin parentInstance;
}

struct DzlDockWidgetClass
{
	DzlBinClass parent;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlDockWindow
{
	GtkWindow parentInstance;
}

struct DzlDockWindowClass
{
	GtkWindowClass parent;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlElasticBin
{
	GtkBin parentInstance;
}

struct DzlElasticBinClass
{
	GtkBinClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlEmptyState
{
	GtkBin parentInstance;
}

struct DzlEmptyStateClass
{
	GtkBinClass parentClass;
}

struct DzlEntryBox;

struct DzlEntryBoxClass
{
	GtkBoxClass parentClass;
}

struct DzlFileChooserEntry
{
	GtkBin parentInstance;
}

struct DzlFileChooserEntryClass
{
	GtkBinClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlFileTransfer
{
	GObject parentInstance;
}

struct DzlFileTransferClass
{
	GObjectClass parentClass;
	void*[12] Padding;
}

struct DzlFileTransferStat
{
	long nFilesTotal;
	long nFiles;
	long nDirsTotal;
	long nDirs;
	long nBytesTotal;
	long nBytes;
	long[10] Padding;
}

struct DzlFuzzyIndex;

struct DzlFuzzyIndexBuilder;

struct DzlFuzzyIndexBuilderClass
{
	GObjectClass parentClass;
}

struct DzlFuzzyIndexClass
{
	GObjectClass parentClass;
}

struct DzlFuzzyIndexCursor;

struct DzlFuzzyIndexCursorClass
{
	GObjectClass parentClass;
}

struct DzlFuzzyIndexMatch;

struct DzlFuzzyIndexMatchClass
{
	GObjectClass parentClass;
}

struct DzlFuzzyMutableIndex;

struct DzlFuzzyMutableIndexMatch
{
	const(char)* key;
	void* value;
	float score;
	uint id;
}

struct DzlGraphColumn;

struct DzlGraphColumnClass
{
	GObjectClass parentClass;
}

struct DzlGraphLineRenderer;

struct DzlGraphLineRendererClass
{
	GObjectClass parentClass;
}

struct DzlGraphModel
{
	GObject parentInstance;
}

struct DzlGraphModelClass
{
	GObjectClass parent;
}

struct DzlGraphModelIter
{
	void*[8] data;
}

struct DzlGraphRenderer;

struct DzlGraphRendererInterface
{
	GTypeInterface parent;
	/** */
	extern(C) void function(DzlGraphRenderer* self, DzlGraphModel* table, long xBegin, long xEnd, double yBegin, double yEnd, cairo_t* cr, cairo_rectangle_int_t* area) render;
}

struct DzlGraphView
{
	GtkDrawingArea parentInstance;
}

struct DzlGraphViewClass
{
	GtkDrawingAreaClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlHeap
{
	char* data;
	size_t len;
}

struct DzlJoinedMenu;

struct DzlJoinedMenuClass
{
	GMenuModelClass parentClass;
}

struct DzlListBox
{
	GtkListBox parentInstance;
}

struct DzlListBoxClass
{
	GtkListBoxClass parentClass;
	void*[4] Reserved;
}

struct DzlListBoxRow
{
	GtkListBoxRow parentInstance;
}

struct DzlListBoxRowClass
{
	GtkListBoxRowClass parentClass;
}

struct DzlListModelFilter;

struct DzlListModelFilterClass
{
	GObjectClass parentClass;
}

struct DzlListStoreAdapter
{
	GObject parentInstance;
}

struct DzlListStoreAdapterClass
{
	GObjectClass parentClass;
}

struct DzlMenuButton
{
	GtkMenuButton parentInstance;
}

struct DzlMenuButtonClass
{
	GtkMenuButtonClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlMenuManager;

struct DzlMenuManagerClass
{
	GObjectClass parentClass;
}

struct DzlMultiPaned
{
	GtkContainer parentInstance;
}

struct DzlMultiPanedClass
{
	GtkContainerClass parent;
	/** */
	extern(C) void function(DzlMultiPaned* self, GtkWidget* child) resizeDragBegin;
	/** */
	extern(C) void function(DzlMultiPaned* self, GtkWidget* child) resizeDragEnd;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlPath;

struct DzlPathBar;

struct DzlPathBarClass
{
	GtkBoxClass parentClass;
}

struct DzlPathClass
{
	GObjectClass parentClass;
}

struct DzlPathElement;

struct DzlPathElementClass
{
	GObjectClass parentClass;
}

struct DzlPatternSpec;

struct DzlPillBox;

struct DzlPillBoxClass
{
	GtkEventBoxClass parentClass;
}

struct DzlPreferences;

struct DzlPreferencesBin
{
	GtkBin parentInstance;
}

struct DzlPreferencesBinClass
{
	GtkBinClass parentClass;
	/** */
	extern(C) void function(DzlPreferencesBin* self, GSettings* settings) connect;
	/** */
	extern(C) void function(DzlPreferencesBin* self, GSettings* settings) disconnect;
	/** */
	extern(C) int function(DzlPreferencesBin* self, DzlPatternSpec* spec) matches;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlPreferencesEntry
{
	DzlPreferencesBin parentInstance;
}

struct DzlPreferencesEntryClass
{
	DzlPreferencesBinClass parentClass;
}

struct DzlPreferencesFileChooserButton;

struct DzlPreferencesFileChooserButtonClass
{
	DzlPreferencesBinClass parentClass;
}

struct DzlPreferencesFlowBox;

struct DzlPreferencesFlowBoxClass
{
	DzlColumnLayoutClass parentClass;
}

struct DzlPreferencesFontButton;

struct DzlPreferencesFontButtonClass
{
	DzlPreferencesBinClass parentClass;
}

struct DzlPreferencesGroup;

struct DzlPreferencesGroupClass
{
	GtkBinClass parentClass;
}

struct DzlPreferencesInterface
{
	GTypeInterface parentInterface;
	/** */
	extern(C) void function(DzlPreferences* self, const(char)* pageName, GHashTable* map) setPage;
	/** */
	extern(C) void function(DzlPreferences* self, const(char)* pageName, const(char)* title, int priority) addPage;
	/** */
	extern(C) void function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* title, int priority) addGroup;
	/** */
	extern(C) void function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* title, GtkSelectionMode mode, int priority) addListGroup;
	/** */
	extern(C) uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* path, const(char)* variantString, const(char)* title, const(char)* subtitle, const(char)* keywords, int priority) addRadio;
	/** */
	extern(C) uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* title, const(char)* keywords, int priority) addFontButton;
	/** */
	extern(C) uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* path, const(char)* variantString, const(char)* title, const(char)* subtitle, const(char)* keywords, int priority) addSwitch;
	/** */
	extern(C) uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* path, const(char)* title, const(char)* subtitle, const(char)* keywords, int priority) addSpinButton;
	/** */
	extern(C) uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* path, const(char)* title, const(char)* subtitle, GtkFileChooserAction action, const(char)* keywords, int priority) addFileChooser;
	/** */
	extern(C) uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, GtkWidget* widget, const(char)* keywords, int priority) addCustom;
	/** */
	extern(C) int function(DzlPreferences* self, uint widgetId) removeId;
	/**
	 * Returns: A #GtkWidget or %NULL.
	 */
	extern(C) GtkWidget* function(DzlPreferences* self, uint widgetId) getWidget;
	/** */
	extern(C) uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, GtkWidget* firstWidget, void* args) addTableRowVa;
}

struct DzlPreferencesPage;

struct DzlPreferencesPageClass
{
	GtkBinClass parentClass;
}

struct DzlPreferencesSpinButton;

struct DzlPreferencesSpinButtonClass
{
	DzlPreferencesBinClass parentClass;
}

struct DzlPreferencesSwitch;

struct DzlPreferencesSwitchClass
{
	DzlPreferencesBinClass parentClass;
}

struct DzlPreferencesView
{
	GtkBin parentInstance;
}

struct DzlPreferencesViewClass
{
	GtkBinClass parentClass;
	void*[8] Reserved;
}

struct DzlPriorityBox
{
	GtkBox parentInstance;
}

struct DzlPriorityBoxClass
{
	GtkBoxClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlProgressButton
{
	GtkButton parentInstance;
}

struct DzlProgressButtonClass
{
	GtkButtonClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlProgressIcon;

struct DzlProgressIconClass
{
	GtkDrawingAreaClass parentClass;
}

struct DzlProgressMenuButton
{
	GtkMenuButton parentInstance;
}

struct DzlProgressMenuButtonClass
{
	GtkMenuButtonClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlPropertiesGroup;

struct DzlPropertiesGroupClass
{
	GObjectClass parentClass;
}

struct DzlRadioBox
{
	GtkBin parentInstance;
}

struct DzlRadioBoxClass
{
	GtkBinClass parentClass;
	void* Padding1;
	void* Padding2;
	void* Padding3;
	void* Padding4;
}

struct DzlReadOnlyListModel;

struct DzlReadOnlyListModelClass
{
	GObjectClass parentClass;
}

struct DzlRecursiveFileMonitor;

struct DzlRecursiveFileMonitorClass
{
	GObjectClass parentClass;
}

struct DzlRing
{
	ubyte* data;
	uint len;
	uint pos;
}

struct DzlScrolledWindow;

struct DzlScrolledWindowClass
{
	GtkScrolledWindowClass parentClass;
}

struct DzlSearchBar
{
	GtkBin parentInstance;
}

struct DzlSearchBarClass
{
	GtkBinClass parentClass;
}

struct DzlSettingsFlagAction;

struct DzlSettingsFlagActionClass
{
	GObjectClass parentClass;
}

struct DzlSettingsSandwich;

struct DzlSettingsSandwichClass
{
	GObjectClass parentClass;
}

struct DzlShortcutAccelDialog;

struct DzlShortcutAccelDialogClass
{
	GtkDialogClass parentClass;
}

struct DzlShortcutChord;

struct DzlShortcutChordTable;

struct DzlShortcutContext;

struct DzlShortcutContextClass
{
	GObjectClass parentClass;
}

struct DzlShortcutController;

struct DzlShortcutControllerClass
{
	GObjectClass parentClass;
}

/**
 * The #DzlShortcutEntry structure can be used to bulk register shortcuts
 * for a particular widget. It can also do the necessary hooks of registering
 * commands that can be changed using the keytheme components.
 */
struct DzlShortcutEntry
{
	/**
	 * the command identifier
	 */
	const(char)* command;
	/**
	 * the phase for activation, or 0 for the default
	 */
	DzlShortcutPhase phase;
	/**
	 * the default accelerator for the command, if any
	 */
	const(char)* defaultAccel;
	/**
	 * the section for the shortcuts window
	 */
	const(char)* section;
	/**
	 * the group for the shortcuts window
	 */
	const(char)* group;
	/**
	 * the title for the shortcuts window
	 */
	const(char)* title;
	/**
	 * the subtitle for the shortcuts window, if any
	 */
	const(char)* subtitle;
}

struct DzlShortcutLabel;

struct DzlShortcutLabelClass
{
	GtkBoxClass parentClass;
}

struct DzlShortcutManager
{
	GObject parentInstance;
}

struct DzlShortcutManagerClass
{
	GObjectClass parentInstance;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlShortcutModel;

struct DzlShortcutModelClass
{
	GtkTreeStoreClass parentClass;
}

struct DzlShortcutSimpleLabel;

struct DzlShortcutSimpleLabelClass
{
	GtkBoxClass parentClass;
}

struct DzlShortcutTheme
{
	GObject parentInstance;
}

struct DzlShortcutThemeClass
{
	GObjectClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlShortcutThemeEditor
{
	GtkBin parentInstance;
}

struct DzlShortcutThemeEditorClass
{
	GtkBinClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlShortcutTooltip;

struct DzlShortcutTooltipClass
{
	GObjectClass parentClass;
}

struct DzlShortcutsGroup;

struct DzlShortcutsGroupClass;

struct DzlShortcutsSection;

struct DzlShortcutsSectionClass;

struct DzlShortcutsShortcut;

struct DzlShortcutsShortcutClass;

struct DzlShortcutsWindow
{
	GtkWindow window;
}

struct DzlShortcutsWindowClass
{
	GtkWindowClass parentClass;
	/** */
	extern(C) void function(DzlShortcutsWindow* self) close;
	/** */
	extern(C) void function(DzlShortcutsWindow* self) search;
}

struct DzlSignalGroup;

struct DzlSignalGroupClass
{
	GObjectClass parentClass;
}

struct DzlSimpleLabel;

struct DzlSimpleLabelClass
{
	GtkWidgetClass parentClass;
}

struct DzlSimplePopover
{
	GtkPopover parentInstance;
}

struct DzlSimplePopoverClass
{
	GtkPopoverClass parent;
	/** */
	extern(C) void function(DzlSimplePopover* self, const(char)* text) activate;
	/** */
	extern(C) int function(DzlSimplePopover* self, uint position, const(char)* chars, uint nChars) insertText;
	/** */
	extern(C) void function(DzlSimplePopover* self) changed;
}

struct DzlSlider
{
	GtkContainer parentInstance;
}

struct DzlSliderClass
{
	GtkContainerClass parentInstance;
}

struct DzlStackList
{
	GtkBin parentInstance;
}

struct DzlStackListClass
{
	GtkBinClass parentInstance;
	/** */
	extern(C) void function(DzlStackList* self, GtkListBoxRow* row) rowActivated;
	/** */
	extern(C) void function(DzlStackList* self, GtkListBoxRow* row) headerActivated;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlStateMachine
{
	GObject parentInstance;
}

struct DzlStateMachineClass
{
	GObjectClass parent;
}

struct DzlSuggestion
{
	GObject parentInstance;
}

struct DzlSuggestionButton
{
	GtkStack parentInstance;
}

struct DzlSuggestionButtonClass
{
	GtkStackClass parentClass;
	void*[8] Reserved;
}

struct DzlSuggestionClass
{
	GObjectClass parentClass;
	/**
	 *
	 * Params:
	 *     self = a #DzlSuggestion
	 *     typedText = The user entered text
	 * Returns: Suffix to append to @typed_text
	 *     or %NULL to leave it unchanged.
	 */
	extern(C) char* function(DzlSuggestion* self, const(char)* typedText) suggestSuffix;
	/**
	 *
	 * Params:
	 *     self = An #DzlSuggestion
	 *     typedText = the text that was typed into the entry
	 * Returns: The replacement text to insert into
	 *     the entry when "tab" is pressed to complete the insertion.
	 */
	extern(C) char* function(DzlSuggestion* self, const(char)* typedText) replaceTypedText;
	/**
	 *
	 * Params:
	 *     self = a #DzlSuggestion
	 * Returns: a #GIcon or %NULL
	 */
	extern(C) GIcon* function(DzlSuggestion* self) getIcon;
	/**
	 *
	 * Params:
	 *     self = a #DzlSuggestion
	 *     widget = a widget that may contain the surface
	 * Returns: a #cairo_surface_t or %NULL
	 */
	extern(C) cairo_surface_t* function(DzlSuggestion* self, GtkWidget* widget) getIconSurface;
	void* Reserved3;
	void* Reserved4;
}

struct DzlSuggestionEntry
{
	GtkEntry parentInstance;
}

struct DzlSuggestionEntryBuffer
{
	GtkEntryBuffer parentInstance;
}

struct DzlSuggestionEntryBufferClass
{
	GtkEntryBufferClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
}

struct DzlSuggestionEntryClass
{
	GtkEntryClass parentClass;
	/** */
	extern(C) void function(DzlSuggestionEntry* self) hideSuggestions;
	/** */
	extern(C) void function(DzlSuggestionEntry* self) showSuggestions;
	/** */
	extern(C) void function(DzlSuggestionEntry* self, int amount) moveSuggestion;
	/** */
	extern(C) void function(DzlSuggestionEntry* self, DzlSuggestion* suggestion) suggestionActivated;
	/** */
	extern(C) void function(DzlSuggestionEntry* self, DzlSuggestion* suggestion) suggestionSelected;
	void*[7] Reserved;
}

struct DzlSuggestionPopover;

struct DzlSuggestionPopoverClass
{
	GtkWindowClass parentClass;
}

struct DzlSuggestionRow
{
	DzlListBoxRow parentInstance;
}

struct DzlSuggestionRowClass
{
	DzlListBoxRowClass parentClass;
	void*[4] Reserved;
}

struct DzlTab;

struct DzlTabClass
{
	DzlBinClass parentClass;
}

struct DzlTabStrip
{
	GtkBox parentInstance;
}

struct DzlTabStripClass
{
	GtkBoxClass parent;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlTaskCache;

struct DzlTaskCacheClass
{
	GObjectClass parentClass;
}

struct DzlThemeManager;

struct DzlThemeManagerClass
{
	GObjectClass parentClass;
}

struct DzlThreeGrid
{
	GtkContainer parentInstance;
}

struct DzlThreeGridClass
{
	GtkContainerClass parentClass;
	void* Reserved1;
	void* Reserved2;
	void* Reserved3;
	void* Reserved4;
	void* Reserved5;
	void* Reserved6;
	void* Reserved7;
	void* Reserved8;
}

struct DzlTree
{
	GtkTreeView parentInstance;
}

struct DzlTreeBuilder
{
	GObject parentInstance;
}

struct DzlTreeBuilderClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, GtkWidget* tree) added;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, GtkWidget* tree) removed;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, DzlTreeNode* node) buildNode;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, DzlTreeNode* parent) buildChildren;
	/** */
	extern(C) int function(DzlTreeBuilder* builder, DzlTreeNode* node) nodeActivated;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, DzlTreeNode* node) nodeSelected;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, DzlTreeNode* node) nodeUnselected;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, DzlTreeNode* node, GMenu* menu) nodePopup;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, DzlTreeNode* node) nodeExpanded;
	/** */
	extern(C) void function(DzlTreeBuilder* builder, DzlTreeNode* node) nodeCollapsed;
	/** */
	extern(C) int function(DzlTreeBuilder* builder, DzlTreeNode* node) nodeDraggable;
	/** */
	extern(C) int function(DzlTreeBuilder* builder, DzlTreeNode* node, GtkSelectionData* data) nodeDroppable;
	/** */
	extern(C) int function(DzlTreeBuilder* builder, DzlTreeNode* node, GtkSelectionData* data) dragDataGet;
	/** */
	extern(C) int function(DzlTreeBuilder* builder, DzlTreeNode* dragNode, DzlTreeNode* dropNode, DzlTreeDropPosition position, GdkDragAction action, GtkSelectionData* data) dragNodeReceived;
	/** */
	extern(C) int function(DzlTreeBuilder* builder, DzlTreeNode* dropNode, DzlTreeDropPosition position, GdkDragAction action, GtkSelectionData* data) dragDataReceived;
	/** */
	extern(C) int function(DzlTreeBuilder* builder, DzlTreeNode* node) dragNodeDelete;
	/** */
	extern(C) void function(DzlTreeBuilder* tree, DzlTreeNode* node, GtkCellRenderer* cell) cellDataFunc;
	void*[11] Padding;
}

struct DzlTreeClass
{
	GtkTreeViewClass parentClass;
	/** */
	extern(C) void function(DzlTree* self, const(char)* actionGroup, const(char)* actionName, const(char)* param) action;
	/** */
	extern(C) void function(DzlTree* self, GtkWidget* widget) populatePopup;
	void*[12] Padding;
}

struct DzlTreeNode;

struct DzlTreeNodeClass
{
	GObjectClass parentClass;
}

struct DzlTrie;

struct DzlWidgetActionGroup;

struct DzlWidgetActionGroupClass
{
	GObjectClass parentClass;
}

struct _DzlGraphColumnClass
{
	GObjectClass parent;
}

/**
 * Function prototype for callbacks provided to dzl_counter_arena_foreach().
 *
 * Params:
 *     counter = the counter.
 *     userData = data supplied to dzl_counter_arena_foreach().
 */
public alias extern(C) void function(DzlCounter* counter, void* userData) DzlCounterForeachFunc;

/** */
public alias extern(C) int function(DzlDirectoryModel* self, GFile* directory, GFileInfo* fileInfo, void* userData) DzlDirectoryModelVisibleFunc;

/** */
public alias extern(C) int function(GObject* object, void* userData) DzlListModelFilterFunc;

/** */
public alias extern(C) int function(GFile* file, void* userData) DzlRecursiveIgnoreFunc;

/** */
public alias extern(C) void function(DzlShortcutChord* chord, void* chordData, void* userData) DzlShortcutChordTableForeach;

/**
 * Called for stack lists that are bound to a #GListModel with
 * dzl_stack_list_push() for each item that gets added to the model.
 *
 * Params:
 *     item = the item from the model for which to create a widget for
 *     userData = user data from dzl_stack_list_push()
 *
 * Returns: a #GtkWidget that represents @item
 */
public alias extern(C) GtkWidget* function(void* item, void* userData) DzlStackListCreateWidgetFunc;

/**
 * Positions the popover in the coordinates defined by @area.
 *
 * If @is_absolute is set to %TRUE, then absolute coordinates are used.
 * Otherwise, the position is expected to be relative to @entry.
 *
 * Params:
 *     entry = a #DzlSuggestionEntry
 *     area = location to place the popover
 *     isAbsolute = If the area is in absolute coordinates
 *     userData = closure data
 *
 * Since: 3.26
 */
public alias extern(C) void function(DzlSuggestionEntry* entry, GdkRectangle* area, int* isAbsolute, void* userData) DzlSuggestionPositionFunc;

/**
 * #DzlTaskCacheCallback is the prototype for a function to be executed to
 * populate an item in the cache.
 *
 * This function will be executed when a fault (cache miss) occurs from
 * a caller requesting an item from the cache.
 *
 * The callee may complete the operation asynchronously, but MUST return
 * either a GObject using g_task_return_pointer() or a #GError using
 * g_task_return_error() or g_task_return_new_error().
 *
 * Params:
 *     self = An #DzlTaskCache.
 *     key = the key to fetch
 *     task = the task to be completed
 *     userData = user_data registered at initialization.
 */
public alias extern(C) void function(DzlTaskCache* self, void* key, GTask* task, void* userData) DzlTaskCacheCallback;

/**
 * Callback to check if @node should be visible.
 *
 * Returns: %TRUE if @node should be visible.
 */
public alias extern(C) int function(DzlTree* tree, DzlTreeNode* node, void* userData) DzlTreeFilterFunc;

/**
 * Callback to check @child, a child of @node, matches a lookup
 * request. Returns %TRUE if @child matches, %FALSE if not.
 *
 * Returns: %TRUE if @child matched
 */
public alias extern(C) int function(DzlTree* tree, DzlTreeNode* node, DzlTreeNode* child, void* userData) DzlTreeFindFunc;

/** */
public alias extern(C) int function(DzlTreeNode* a, DzlTreeNode* b, void* userData) DzlTreeNodeCompareFunc;

/** */
public alias extern(C) int function(DzlTrie* dzlTrie, const(char)* key, void* value, void* userData) DzlTrieTraverseFunc;

enum COUNTER_REQUIRES_ATOMIC = 1;
alias DZL_COUNTER_REQUIRES_ATOMIC = COUNTER_REQUIRES_ATOMIC;

enum DOCK_BIN_STYLE_CLASS_PINNED = "pinned";
alias DZL_DOCK_BIN_STYLE_CLASS_PINNED = DOCK_BIN_STYLE_CLASS_PINNED;

enum ENABLE_TRACE = 0;
alias DZL_ENABLE_TRACE = ENABLE_TRACE;

enum LOG_LEVEL_TRACE = 1;
alias DZL_LOG_LEVEL_TRACE = LOG_LEVEL_TRACE;

/**
 * Dzl major version component (e.g. 1 if %DZL_VERSION is 1.2.3)
 */
enum MAJOR_VERSION = 3;
alias DZL_MAJOR_VERSION = MAJOR_VERSION;

/**
 * Dzl micro version component (e.g. 3 if %DZL_VERSION is 1.2.3)
 */
enum MICRO_VERSION = 1;
alias DZL_MICRO_VERSION = MICRO_VERSION;

/**
 * Dzl minor version component (e.g. 2 if %DZL_VERSION is 1.2.3)
 */
enum MINOR_VERSION = 34;
alias DZL_MINOR_VERSION = MINOR_VERSION;

/**
 * Dazzle version, encoded as a string, useful for printing and
 * concatenation.
 */
enum VERSION_S = "3.34.1";
alias DZL_VERSION_S = VERSION_S;
