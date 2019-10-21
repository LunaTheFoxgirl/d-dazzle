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
module dazzle.ShortcutController;

private import dazzle.ShortcutChord;
private import dazzle.ShortcutContext;
private import dazzle.ShortcutManager;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Widget;
private import std.algorithm;


/** */
public class ShortcutController : ObjectG
{
	/** the main Gtk struct */
	protected DzlShortcutController* dzlShortcutController;

	/** Get the main Gtk struct */
	public DzlShortcutController* getShortcutControllerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutController;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutController;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutController* dzlShortcutController, bool ownedRef = false)
	{
		this.dzlShortcutController = dzlShortcutController;
		super(cast(GObject*)dzlShortcutController, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_controller_get_type();
	}

	/** */
	public this(Widget widget)
	{
		auto p = dzl_shortcut_controller_new((widget is null) ? null : widget.getWidgetStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutController*) p, true);
	}

	/**
	 * Finds the registered #DzlShortcutController for a widget.
	 *
	 * The controller is created if it does not already exist.
	 *
	 * Returns: An #DzlShortcutController or %NULL.
	 */
	public static ShortcutController find(Widget widget)
	{
		auto p = dzl_shortcut_controller_find((widget is null) ? null : widget.getWidgetStruct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutController)(cast(DzlShortcutController*) p);
	}

	/**
	 * Finds the registered #DzlShortcutController for a widget.
	 *
	 * If no controller is found, %NULL is returned.
	 *
	 * Returns: An #DzlShortcutController or %NULL.
	 */
	public static ShortcutController tryFind(Widget widget)
	{
		auto p = dzl_shortcut_controller_try_find((widget is null) ? null : widget.getWidgetStruct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutController)(cast(DzlShortcutController*) p);
	}

	/** */
	public void addCommandAction(string commandId, string defaultAccel, DzlShortcutPhase phase, string action)
	{
		dzl_shortcut_controller_add_command_action(dzlShortcutController, Str.toStringz(commandId), Str.toStringz(defaultAccel), phase, Str.toStringz(action));
	}

	/** */
	public void addCommandCallback(string commandId, string defaultAccel, DzlShortcutPhase phase, GtkCallback callback, void* callbackData, GDestroyNotify callbackDataDestroy)
	{
		dzl_shortcut_controller_add_command_callback(dzlShortcutController, Str.toStringz(commandId), Str.toStringz(defaultAccel), phase, callback, callbackData, callbackDataDestroy);
	}

	/**
	 * This method will locate and execute the command matching the id @command.
	 *
	 * If the command is not found, %FALSE is returned.
	 *
	 * Params:
	 *     command = the id of the command
	 *
	 * Returns: %TRUE if the command was found and executed.
	 */
	public bool executeCommand(string command)
	{
		return dzl_shortcut_controller_execute_command(dzlShortcutController, Str.toStringz(command)) != 0;
	}

	/**
	 * This function gets the #DzlShortcutController:context property, which
	 * is the current context to dispatch events to. An #DzlShortcutContext
	 * is a group of keybindings that may be activated in response to a
	 * single or series of #GdkEventKey.
	 *
	 * Returns: A #DzlShortcutContext or %NULL.
	 *
	 * Since: 3.26
	 */
	public ShortcutContext getContext()
	{
		auto p = dzl_shortcut_controller_get_context(dzlShortcutController);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutContext)(cast(DzlShortcutContext*) p);
	}

	/**
	 * Controllers can have a different context for a particular phase, which allows
	 * them to activate different keybindings depending if the event in capture,
	 * bubble, or dispatch.
	 *
	 * Params:
	 *     phase = the phase for the shorcut delivery
	 *
	 * Returns: A #DzlShortcutContext or %NULL.
	 *
	 * Since: 3.26
	 */
	public ShortcutContext getContextForPhase(DzlShortcutPhase phase)
	{
		auto p = dzl_shortcut_controller_get_context_for_phase(dzlShortcutController, phase);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutContext)(cast(DzlShortcutContext*) p);
	}

	/**
	 * This method gets the #DzlShortcutController:current-chord property.
	 * This is useful if you want to monitor in-progress chord building.
	 *
	 * Note that this value will only be valid on the controller for the
	 * toplevel widget (a #GtkWindow). Chords are not tracked at the
	 * individual widget controller level.
	 *
	 * Returns: A #DzlShortcutChord or %NULL.
	 */
	public ShortcutChord getCurrentChord()
	{
		auto p = dzl_shortcut_controller_get_current_chord(dzlShortcutController);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutChord)(cast(DzlShortcutChord*) p);
	}

	/**
	 * Gets the #DzlShortcutManager associated with this controller.
	 *
	 * Generally, this will look for the root controller's manager as mixing and
	 * matching managers in a single window hierarchy is not supported.
	 *
	 * Returns: A #DzlShortcutManager.
	 */
	public ShortcutManager getManager()
	{
		auto p = dzl_shortcut_controller_get_manager(dzlShortcutController);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutManager)(cast(DzlShortcutManager*) p);
	}

	/**
	 * Returns: the widget for the controller
	 *
	 * Since: 3.34
	 */
	public Widget getWidget()
	{
		auto p = dzl_shortcut_controller_get_widget(dzlShortcutController);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/** */
	public void removeAccel(string accel, DzlShortcutPhase phase)
	{
		dzl_shortcut_controller_remove_accel(dzlShortcutController, Str.toStringz(accel), phase);
	}

	/**
	 * Changes the context for the controller to the context matching @name.
	 *
	 * Contexts are resolved at runtime through the current theme (and possibly
	 * a parent theme if it inherits from one).
	 *
	 * Params:
	 *     name = The name of the context
	 *
	 * Since: 3.26
	 */
	public void setContextByName(string name)
	{
		dzl_shortcut_controller_set_context_by_name(dzlShortcutController, Str.toStringz(name));
	}

	/**
	 * Sets the #DzlShortcutController:manager property.
	 *
	 * If you set this to %NULL, it will revert to the default #DzlShortcutManager
	 * for the process.
	 *
	 * Params:
	 *     manager = A #DzlShortcutManager or %NULL
	 */
	public void setManager(ShortcutManager manager)
	{
		dzl_shortcut_controller_set_manager(dzlShortcutController, (manager is null) ? null : manager.getShortcutManagerStruct());
	}

	/**
	 * This signal is emitted when the shortcut controller is requesting
	 * the widget to reset any state it may have regarding the shortcut
	 * controller. Such an example might be a modal system that lives
	 * outside the controller whose state should be cleared in response
	 * to the controller changing modes.
	 */
	gulong addOnReset(void delegate(ShortcutController) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "reset", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * This changes the current context on the #DzlShortcutController to be the
	 * context matching @name. This is found by looking up the context by name
	 * in the active #DzlShortcutTheme.
	 *
	 * Params:
	 *     name = The name of the context
	 */
	gulong addOnSetContextNamed(void delegate(string, ShortcutController) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "set-context-named", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
