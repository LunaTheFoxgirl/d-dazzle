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
module dazzle.SignalGroup;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import std.algorithm;


/**
 * #DzlSignalGroup manages to simplify the process of connecting
 * many signals to a #GObject as a group. As such there is no API
 * to disconnect a signal from the group.
 * 
 * In particular, this allows you to:
 * 
 * - Change the target instance, which automatically causes disconnection
 * of the signals from the old instance and connecting to the new instance.
 * - Block and unblock signals as a group
 * - Ensuring that blocked state transfers across target instances.
 * 
 * One place you might want to use such a structure is with #GtkTextView and
 * #GtkTextBuffer. Often times, you'll need to connect to many signals on
 * #GtkTextBuffer from a #GtkTextView subclass. This allows you to create a
 * signal group during instance construction, simply bind the
 * #GtkTextView:buffer property to #DzlSignalGroup:target and connect
 * all the signals you need. When the #GtkTextView:buffer property changes
 * all of the signals will be transitioned correctly.
 */
public class SignalGroup : ObjectG
{
	/** the main Gtk struct */
	protected DzlSignalGroup* dzlSignalGroup;

	/** Get the main Gtk struct */
	public DzlSignalGroup* getSignalGroupStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSignalGroup;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSignalGroup;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSignalGroup* dzlSignalGroup, bool ownedRef = false)
	{
		this.dzlSignalGroup = dzlSignalGroup;
		super(cast(GObject*)dzlSignalGroup, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_signal_group_get_type();
	}

	/**
	 * Creates a new #DzlSignalGroup for target instances of @target_type.
	 *
	 * Params:
	 *     targetType = the #GType of the target instance.
	 *
	 * Returns: a new #DzlSignalGroup
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GType targetType)
	{
		auto p = dzl_signal_group_new(targetType);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSignalGroup*) p, true);
	}

	/**
	 * Blocks all signal handlers managed by @self so they will not
	 * be called during any signal emissions. Must be unblocked exactly
	 * the same number of times it has been blocked to become active again.
	 *
	 * This blocked state will be kept across changes of the target instance.
	 *
	 * See: g_signal_handler_block().
	 */
	public void block()
	{
		dzl_signal_group_block(dzlSignalGroup);
	}

	/**
	 * Connects @callback to the signal @detailed_signal
	 * on the target instance of @self.
	 *
	 * See: g_signal_connect().
	 *
	 * Params:
	 *     detailedSignal = a string of the form "signal-name::detail"
	 *     cHandler = the #GCallback to connect
	 *     data = the data to pass to @callback calls
	 */
	public void connect(string detailedSignal, GCallback cHandler, void* data)
	{
		dzl_signal_group_connect(dzlSignalGroup, Str.toStringz(detailedSignal), cHandler, data);
	}

	/**
	 * Connects @callback to the signal @detailed_signal
	 * on the target instance of @self.
	 *
	 * The @callback will be called after the default handler of the signal.
	 *
	 * See: g_signal_connect_after().
	 *
	 * Params:
	 *     detailedSignal = a string of the form "signal-name::detail"
	 *     cHandler = the #GCallback to connect
	 *     data = the data to pass to @callback calls
	 */
	public void connectAfter(string detailedSignal, GCallback cHandler, void* data)
	{
		dzl_signal_group_connect_after(dzlSignalGroup, Str.toStringz(detailedSignal), cHandler, data);
	}

	/**
	 * Connects @callback to the signal @detailed_signal
	 * on the target instance of @self.
	 *
	 * See: g_signal_connect_data().
	 *
	 * Params:
	 *     detailedSignal = a string of the form "signal-name::detail"
	 *     cHandler = the #GCallback to connect
	 *     data = the data to pass to @callback calls
	 *     notify = function to be called when disposing of @self
	 *     flags = the flags used to create the signal connection
	 */
	public void connectData(string detailedSignal, GCallback cHandler, void* data, GClosureNotify notify, GConnectFlags flags)
	{
		dzl_signal_group_connect_data(dzlSignalGroup, Str.toStringz(detailedSignal), cHandler, data, notify, flags);
	}

	/**
	 * Connects @callback to the signal @detailed_signal
	 * on the target object of @self.
	 *
	 * Ensures that the @object stays alive during the call to @callback
	 * by temporarily adding a reference count. When the @object is destroyed
	 * the signal handler will automatically be removed.
	 *
	 * See: g_signal_connect_object().
	 *
	 * Params:
	 *     detailedSignal = a string of the form "signal-name::detail"
	 *     cHandler = the #GCallback to connect
	 *     object = the #GObject to pass as data to @callback calls
	 */
	public void connectObject(string detailedSignal, GCallback cHandler, void* object, GConnectFlags flags)
	{
		dzl_signal_group_connect_object(dzlSignalGroup, Str.toStringz(detailedSignal), cHandler, object, flags);
	}

	/**
	 * Connects @callback to the signal @detailed_signal
	 * on the target instance of @self.
	 *
	 * The instance on which the signal is emitted and @data
	 * will be swapped when calling @callback.
	 *
	 * See: g_signal_connect_swapped().
	 *
	 * Params:
	 *     detailedSignal = a string of the form "signal-name::detail"
	 *     cHandler = the #GCallback to connect
	 *     data = the data to pass to @callback calls
	 */
	public void connectSwapped(string detailedSignal, GCallback cHandler, void* data)
	{
		dzl_signal_group_connect_swapped(dzlSignalGroup, Str.toStringz(detailedSignal), cHandler, data);
	}

	/**
	 * Gets the target instance used when connecting signals.
	 *
	 * Returns: The target instance.
	 */
	public ObjectG getTarget()
	{
		auto p = dzl_signal_group_get_target(dzlSignalGroup);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) p);
	}

	/**
	 * Sets the target instance used when connecting signals. Any signal
	 * that has been registered with dzl_signal_group_connect_object() or
	 * similar functions will be connected to this object.
	 *
	 * If the target instance was previously set, signals will be
	 * disconnected from that object prior to connecting to @target.
	 *
	 * Params:
	 *     target = The target instance used
	 *         when connecting signals.
	 */
	public void setTarget(ObjectG target)
	{
		dzl_signal_group_set_target(dzlSignalGroup, (target is null) ? null : target.getObjectGStruct());
	}

	/**
	 * Unblocks all signal handlers managed by @self so they will be
	 * called again during any signal emissions unless it is blocked
	 * again. Must be unblocked exactly the same number of times it
	 * has been blocked to become active again.
	 *
	 * See: g_signal_handler_unblock().
	 */
	public void unblock()
	{
		dzl_signal_group_unblock(dzlSignalGroup);
	}

	/**
	 * This signal is emitted when the target instance of @self
	 * is set to a new #GObject.
	 *
	 * This signal will only be emitted if the target of @self is non-%NULL.
	 *
	 * Params:
	 *     instance_ = a #GObject
	 */
	gulong addOnBind(void delegate(ObjectG, SignalGroup) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "bind", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * This signal is emitted when the target instance of @self
	 * is set to a new #GObject.
	 *
	 * This signal will only be emitted if the previous target
	 * of @self is non-%NULL.
	 */
	gulong addOnUnbind(void delegate(SignalGroup) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "unbind", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
