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
module dazzle.StateMachine;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ActionIF;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Value;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;


/** */
public class StateMachine : ObjectG, BuildableIF
{
	/** the main Gtk struct */
	protected DzlStateMachine* dzlStateMachine;

	/** Get the main Gtk struct */
	public DzlStateMachine* getStateMachineStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlStateMachine;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlStateMachine;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlStateMachine* dzlStateMachine, bool ownedRef = false)
	{
		this.dzlStateMachine = dzlStateMachine;
		super(cast(GObject*)dzlStateMachine, ownedRef);
	}

	// add the Buildable capabilities
	mixin BuildableT!(DzlStateMachine);


	/** */
	public static GType getType()
	{
		return dzl_state_machine_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_state_machine_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlStateMachine*) p, true);
	}

	/** */
	public static void buildableIfaceInit(GtkBuildableIface* iface)
	{
		dzl_state_machine_buildable_iface_init(iface);
	}

	/** */
	public void addBinding(string state, void* sourceObject, string sourceProperty, void* targetObject, string targetProperty, GBindingFlags flags)
	{
		dzl_state_machine_add_binding(dzlStateMachine, Str.toStringz(state), sourceObject, Str.toStringz(sourceProperty), targetObject, Str.toStringz(targetProperty), flags);
	}

	/** */
	public void addPropertyValist(string state, void* object, string property, void* varArgs)
	{
		dzl_state_machine_add_property_valist(dzlStateMachine, Str.toStringz(state), object, Str.toStringz(property), varArgs);
	}

	/** */
	public void addPropertyv(string state, void* object, string property, Value value)
	{
		dzl_state_machine_add_propertyv(dzlStateMachine, Str.toStringz(state), object, Str.toStringz(property), (value is null) ? null : value.getValueStruct());
	}

	/** */
	public void addStyle(string state, Widget widget, string style)
	{
		dzl_state_machine_add_style(dzlStateMachine, Str.toStringz(state), (widget is null) ? null : widget.getWidgetStruct(), Str.toStringz(style));
	}

	/**
	 * Connects to the @detailed_signal of @source only when the current
	 * state of the state machine is @state.
	 *
	 * Params:
	 *     state = The state the signal connection should exist within
	 *     source = the source object to connect to
	 *     detailedSignal = The detailed signal of @source to connect.
	 *     callback = The callback to execute upon signal emission.
	 *     userData = The user data for @callback.
	 *     flags = signal connection flags.
	 */
	public void connectObject(string state, void* source, string detailedSignal, GCallback callback, void* userData, GConnectFlags flags)
	{
		dzl_state_machine_connect_object(dzlStateMachine, Str.toStringz(state), source, Str.toStringz(detailedSignal), callback, userData, flags);
	}

	/**
	 * Creates a new #GAction with the name of @name.
	 *
	 * Setting the state of this action will toggle the state of the state machine.
	 * You should use g_variant_new_string() or similar to create the state.
	 *
	 * Params:
	 *     name = the name of the action.
	 *
	 * Returns: A newly created #GAction.
	 */
	public ActionIF createAction(string name)
	{
		auto p = dzl_state_machine_create_action(dzlStateMachine, Str.toStringz(name));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ActionIF)(cast(GAction*) p, true);
	}

	/**
	 * Gets the #DzlStateMachine:state property. This is the name of the
	 * current state of the machine.
	 *
	 * Returns: The current state of the machine.
	 */
	public string getState()
	{
		return Str.toString(dzl_state_machine_get_state(dzlStateMachine));
	}

	/**
	 * Checks to see if the current state of the #DzlStateMachine matches @state.
	 *
	 * Params:
	 *     state = the name of the state to check
	 *
	 * Returns: %TRUE if @self is currently set to @state.
	 *
	 * Since: 3.28
	 */
	public bool isState(string state)
	{
		return dzl_state_machine_is_state(dzlStateMachine, Str.toStringz(state)) != 0;
	}

	/**
	 * Sets the #DzlStateMachine:state property.
	 *
	 * Registered state transformations will be applied during the state
	 * transformation.
	 *
	 * If the transition results in a cyclic operation, the state will stop at
	 * the last state before the cycle was detected.
	 */
	public void setState(string state)
	{
		dzl_state_machine_set_state(dzlStateMachine, Str.toStringz(state));
	}
}
