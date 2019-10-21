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
module dazzle.c.functions;

import std.stdio;
import dazzle.c.types;
import gtkd.Loader;

version (Windows)
	static immutable LIBRARY_DAZZLE = ["libdazzle-1.0-0.dll;dazzle-1.0-0.dll;dazzle-1.dll"];
else version (OSX)
	static immutable LIBRARY_DAZZLE = ["libdazzle-1.0.0.dylib"];
else
	static immutable LIBRARY_DAZZLE = ["libdazzle-1.0.so.0"];

shared static this()
{
	// dazzle.Animation

	Linker.link(dzl_animation_get_type, "dzl_animation_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_animation_calculate_duration, "dzl_animation_calculate_duration", LIBRARY_DAZZLE);
	Linker.link(dzl_animation_add_property, "dzl_animation_add_property", LIBRARY_DAZZLE);
	Linker.link(dzl_animation_start, "dzl_animation_start", LIBRARY_DAZZLE);
	Linker.link(dzl_animation_stop, "dzl_animation_stop", LIBRARY_DAZZLE);

	// dazzle.Application

	Linker.link(dzl_application_get_type, "dzl_application_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_application_new, "dzl_application_new", LIBRARY_DAZZLE);
	Linker.link(dzl_application_add_resources, "dzl_application_add_resources", LIBRARY_DAZZLE);
	Linker.link(dzl_application_get_menu_by_id, "dzl_application_get_menu_by_id", LIBRARY_DAZZLE);
	Linker.link(dzl_application_get_menu_manager, "dzl_application_get_menu_manager", LIBRARY_DAZZLE);
	Linker.link(dzl_application_get_shortcut_manager, "dzl_application_get_shortcut_manager", LIBRARY_DAZZLE);
	Linker.link(dzl_application_get_theme_manager, "dzl_application_get_theme_manager", LIBRARY_DAZZLE);
	Linker.link(dzl_application_remove_resources, "dzl_application_remove_resources", LIBRARY_DAZZLE);

	// dazzle.ApplicationWindow

	Linker.link(dzl_application_window_get_type, "dzl_application_window_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_application_window_get_fullscreen, "dzl_application_window_get_fullscreen", LIBRARY_DAZZLE);
	Linker.link(dzl_application_window_get_titlebar, "dzl_application_window_get_titlebar", LIBRARY_DAZZLE);
	Linker.link(dzl_application_window_set_fullscreen, "dzl_application_window_set_fullscreen", LIBRARY_DAZZLE);
	Linker.link(dzl_application_window_set_titlebar, "dzl_application_window_set_titlebar", LIBRARY_DAZZLE);

	// dazzle.Bin

	Linker.link(dzl_bin_get_type, "dzl_bin_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_bin_new, "dzl_bin_new", LIBRARY_DAZZLE);

	// dazzle.BindingGroup

	Linker.link(dzl_binding_group_get_type, "dzl_binding_group_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_binding_group_new, "dzl_binding_group_new", LIBRARY_DAZZLE);
	Linker.link(dzl_binding_group_bind, "dzl_binding_group_bind", LIBRARY_DAZZLE);
	Linker.link(dzl_binding_group_bind_full, "dzl_binding_group_bind_full", LIBRARY_DAZZLE);
	Linker.link(dzl_binding_group_bind_with_closures, "dzl_binding_group_bind_with_closures", LIBRARY_DAZZLE);
	Linker.link(dzl_binding_group_get_source, "dzl_binding_group_get_source", LIBRARY_DAZZLE);
	Linker.link(dzl_binding_group_set_source, "dzl_binding_group_set_source", LIBRARY_DAZZLE);

	// dazzle.BoldingLabel

	Linker.link(dzl_bolding_label_get_type, "dzl_bolding_label_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_bolding_label_new, "dzl_bolding_label_new", LIBRARY_DAZZLE);
	Linker.link(dzl_bolding_label_new_with_mnemonic, "dzl_bolding_label_new_with_mnemonic", LIBRARY_DAZZLE);
	Linker.link(dzl_bolding_label_set_bold, "dzl_bolding_label_set_bold", LIBRARY_DAZZLE);
	Linker.link(dzl_bolding_label_set_weight, "dzl_bolding_label_set_weight", LIBRARY_DAZZLE);

	// dazzle.Box

	Linker.link(dzl_box_get_type, "dzl_box_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_box_new, "dzl_box_new", LIBRARY_DAZZLE);
	Linker.link(dzl_box_get_max_width_request, "dzl_box_get_max_width_request", LIBRARY_DAZZLE);
	Linker.link(dzl_box_get_nth_child, "dzl_box_get_nth_child", LIBRARY_DAZZLE);
	Linker.link(dzl_box_set_max_width_request, "dzl_box_set_max_width_request", LIBRARY_DAZZLE);

	// dazzle.BoxTheatric

	Linker.link(dzl_box_theatric_get_type, "dzl_box_theatric_get_type", LIBRARY_DAZZLE);

	// dazzle.CenteringBin

	Linker.link(dzl_centering_bin_get_type, "dzl_centering_bin_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_centering_bin_new, "dzl_centering_bin_new", LIBRARY_DAZZLE);

	// dazzle.ChildPropertyAction

	Linker.link(dzl_child_property_action_get_type, "dzl_child_property_action_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_child_property_action_new, "dzl_child_property_action_new", LIBRARY_DAZZLE);

	// dazzle.ColumnLayout

	Linker.link(dzl_column_layout_get_type, "dzl_column_layout_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_new, "dzl_column_layout_new", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_get_column_spacing, "dzl_column_layout_get_column_spacing", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_get_column_width, "dzl_column_layout_get_column_width", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_get_max_columns, "dzl_column_layout_get_max_columns", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_get_row_spacing, "dzl_column_layout_get_row_spacing", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_set_column_spacing, "dzl_column_layout_set_column_spacing", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_set_column_width, "dzl_column_layout_set_column_width", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_set_max_columns, "dzl_column_layout_set_max_columns", LIBRARY_DAZZLE);
	Linker.link(dzl_column_layout_set_row_spacing, "dzl_column_layout_set_row_spacing", LIBRARY_DAZZLE);

	// dazzle.Counter

	Linker.link(dzl_counter_get, "dzl_counter_get", LIBRARY_DAZZLE);
	Linker.link(dzl_counter_reset, "dzl_counter_reset", LIBRARY_DAZZLE);

	// dazzle.CounterArena

	Linker.link(dzl_counter_arena_get_type, "dzl_counter_arena_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_counter_arena_new_for_pid, "dzl_counter_arena_new_for_pid", LIBRARY_DAZZLE);
	Linker.link(dzl_counter_arena_foreach, "dzl_counter_arena_foreach", LIBRARY_DAZZLE);
	Linker.link(dzl_counter_arena_ref, "dzl_counter_arena_ref", LIBRARY_DAZZLE);
	Linker.link(dzl_counter_arena_register, "dzl_counter_arena_register", LIBRARY_DAZZLE);
	Linker.link(dzl_counter_arena_unref, "dzl_counter_arena_unref", LIBRARY_DAZZLE);
	Linker.link(dzl_counter_arena_get_default, "dzl_counter_arena_get_default", LIBRARY_DAZZLE);

	// dazzle.CountersWindow

	Linker.link(dzl_counters_window_get_type, "dzl_counters_window_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_counters_window_new, "dzl_counters_window_new", LIBRARY_DAZZLE);
	Linker.link(dzl_counters_window_get_arena, "dzl_counters_window_get_arena", LIBRARY_DAZZLE);
	Linker.link(dzl_counters_window_set_arena, "dzl_counters_window_set_arena", LIBRARY_DAZZLE);

	// dazzle.CpuGraph

	Linker.link(dzl_cpu_graph_get_type, "dzl_cpu_graph_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_cpu_graph_new_full, "dzl_cpu_graph_new_full", LIBRARY_DAZZLE);

	// dazzle.CpuModel

	Linker.link(dzl_cpu_model_get_type, "dzl_cpu_model_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_cpu_model_new, "dzl_cpu_model_new", LIBRARY_DAZZLE);

	// dazzle.CssProvider

	Linker.link(dzl_css_provider_get_type, "dzl_css_provider_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_css_provider_new, "dzl_css_provider_new", LIBRARY_DAZZLE);

	// dazzle.DirectoryModel

	Linker.link(dzl_directory_model_get_type, "dzl_directory_model_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_model_new, "dzl_directory_model_new", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_model_get_directory, "dzl_directory_model_get_directory", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_model_set_directory, "dzl_directory_model_set_directory", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_model_set_visible_func, "dzl_directory_model_set_visible_func", LIBRARY_DAZZLE);

	// dazzle.DirectoryReaper

	Linker.link(dzl_directory_reaper_get_type, "dzl_directory_reaper_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_reaper_new, "dzl_directory_reaper_new", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_reaper_add_directory, "dzl_directory_reaper_add_directory", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_reaper_add_file, "dzl_directory_reaper_add_file", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_reaper_add_glob, "dzl_directory_reaper_add_glob", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_reaper_execute, "dzl_directory_reaper_execute", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_reaper_execute_async, "dzl_directory_reaper_execute_async", LIBRARY_DAZZLE);
	Linker.link(dzl_directory_reaper_execute_finish, "dzl_directory_reaper_execute_finish", LIBRARY_DAZZLE);

	// dazzle.Dock

	Linker.link(dzl_dock_get_type, "dzl_dock_get_type", LIBRARY_DAZZLE);

	// dazzle.DockBin

	Linker.link(dzl_dock_bin_get_type, "dzl_dock_bin_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_bin_new, "dzl_dock_bin_new", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_bin_get_bottom_edge, "dzl_dock_bin_get_bottom_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_bin_get_center_widget, "dzl_dock_bin_get_center_widget", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_bin_get_left_edge, "dzl_dock_bin_get_left_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_bin_get_right_edge, "dzl_dock_bin_get_right_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_bin_get_top_edge, "dzl_dock_bin_get_top_edge", LIBRARY_DAZZLE);

	// dazzle.DockBinEdge

	Linker.link(dzl_dock_bin_edge_get_type, "dzl_dock_bin_edge_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_bin_edge_get_edge, "dzl_dock_bin_edge_get_edge", LIBRARY_DAZZLE);

	// dazzle.DockItem

	Linker.link(dzl_dock_item_get_type, "dzl_dock_item_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_adopt, "dzl_dock_item_adopt", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_close, "dzl_dock_item_close", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_emit_presented, "dzl_dock_item_emit_presented", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_get_can_close, "dzl_dock_item_get_can_close", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_get_can_minimize, "dzl_dock_item_get_can_minimize", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_get_child_visible, "dzl_dock_item_get_child_visible", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_get_icon_name, "dzl_dock_item_get_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_get_manager, "dzl_dock_item_get_manager", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_get_parent, "dzl_dock_item_get_parent", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_get_title, "dzl_dock_item_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_has_widgets, "dzl_dock_item_has_widgets", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_minimize, "dzl_dock_item_minimize", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_needs_attention, "dzl_dock_item_needs_attention", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_present, "dzl_dock_item_present", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_present_child, "dzl_dock_item_present_child", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_ref_gicon, "dzl_dock_item_ref_gicon", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_release, "dzl_dock_item_release", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_set_child_visible, "dzl_dock_item_set_child_visible", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_set_manager, "dzl_dock_item_set_manager", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_item_update_visibility, "dzl_dock_item_update_visibility", LIBRARY_DAZZLE);

	// dazzle.DockManager

	Linker.link(dzl_dock_manager_get_type, "dzl_dock_manager_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_manager_new, "dzl_dock_manager_new", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_manager_pause_grabs, "dzl_dock_manager_pause_grabs", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_manager_register_dock, "dzl_dock_manager_register_dock", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_manager_release_transient_grab, "dzl_dock_manager_release_transient_grab", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_manager_unpause_grabs, "dzl_dock_manager_unpause_grabs", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_manager_unregister_dock, "dzl_dock_manager_unregister_dock", LIBRARY_DAZZLE);

	// dazzle.DockOverlay

	Linker.link(dzl_dock_overlay_get_type, "dzl_dock_overlay_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_overlay_new, "dzl_dock_overlay_new", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_overlay_get_edge, "dzl_dock_overlay_get_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_overlay_get_edge_adjustment, "dzl_dock_overlay_get_edge_adjustment", LIBRARY_DAZZLE);

	// dazzle.DockOverlayEdge

	Linker.link(dzl_dock_overlay_edge_get_type, "dzl_dock_overlay_edge_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_overlay_edge_get_edge, "dzl_dock_overlay_edge_get_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_overlay_edge_get_position, "dzl_dock_overlay_edge_get_position", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_overlay_edge_set_edge, "dzl_dock_overlay_edge_set_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_overlay_edge_set_position, "dzl_dock_overlay_edge_set_position", LIBRARY_DAZZLE);

	// dazzle.DockPaned

	Linker.link(dzl_dock_paned_get_type, "dzl_dock_paned_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_paned_new, "dzl_dock_paned_new", LIBRARY_DAZZLE);

	// dazzle.DockRevealer

	Linker.link(dzl_dock_revealer_get_type, "dzl_dock_revealer_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_new, "dzl_dock_revealer_new", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_animate_to_position, "dzl_dock_revealer_animate_to_position", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_get_child_revealed, "dzl_dock_revealer_get_child_revealed", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_get_position, "dzl_dock_revealer_get_position", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_get_position_set, "dzl_dock_revealer_get_position_set", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_get_reveal_child, "dzl_dock_revealer_get_reveal_child", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_get_transition_duration, "dzl_dock_revealer_get_transition_duration", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_get_transition_type, "dzl_dock_revealer_get_transition_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_is_animating, "dzl_dock_revealer_is_animating", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_set_position, "dzl_dock_revealer_set_position", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_set_position_set, "dzl_dock_revealer_set_position_set", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_set_reveal_child, "dzl_dock_revealer_set_reveal_child", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_set_transition_duration, "dzl_dock_revealer_set_transition_duration", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_revealer_set_transition_type, "dzl_dock_revealer_set_transition_type", LIBRARY_DAZZLE);

	// dazzle.DockStack

	Linker.link(dzl_dock_stack_get_type, "dzl_dock_stack_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_stack_new, "dzl_dock_stack_new", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_stack_get_edge, "dzl_dock_stack_get_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_stack_get_show_pinned_button, "dzl_dock_stack_get_show_pinned_button", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_stack_get_style, "dzl_dock_stack_get_style", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_stack_set_edge, "dzl_dock_stack_set_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_stack_set_show_pinned_button, "dzl_dock_stack_set_show_pinned_button", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_stack_set_style, "dzl_dock_stack_set_style", LIBRARY_DAZZLE);

	// dazzle.DockTransientGrab

	Linker.link(dzl_dock_transient_grab_get_type, "dzl_dock_transient_grab_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_new, "dzl_dock_transient_grab_new", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_acquire, "dzl_dock_transient_grab_acquire", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_add_item, "dzl_dock_transient_grab_add_item", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_cancel, "dzl_dock_transient_grab_cancel", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_contains, "dzl_dock_transient_grab_contains", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_get_timeout, "dzl_dock_transient_grab_get_timeout", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_is_descendant, "dzl_dock_transient_grab_is_descendant", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_release, "dzl_dock_transient_grab_release", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_remove_item, "dzl_dock_transient_grab_remove_item", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_set_timeout, "dzl_dock_transient_grab_set_timeout", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_transient_grab_steal_common_ancestors, "dzl_dock_transient_grab_steal_common_ancestors", LIBRARY_DAZZLE);

	// dazzle.DockWidget

	Linker.link(dzl_dock_widget_get_type, "dzl_dock_widget_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_widget_new, "dzl_dock_widget_new", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_widget_set_gicon, "dzl_dock_widget_set_gicon", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_widget_set_icon_name, "dzl_dock_widget_set_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_widget_set_title, "dzl_dock_widget_set_title", LIBRARY_DAZZLE);

	// dazzle.DockWindow

	Linker.link(dzl_dock_window_get_type, "dzl_dock_window_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_dock_window_new, "dzl_dock_window_new", LIBRARY_DAZZLE);

	// dazzle.ElasticBin

	Linker.link(dzl_elastic_bin_get_type, "dzl_elastic_bin_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_elastic_bin_new, "dzl_elastic_bin_new", LIBRARY_DAZZLE);

	// dazzle.EmptyState

	Linker.link(dzl_empty_state_get_type, "dzl_empty_state_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_empty_state_new, "dzl_empty_state_new", LIBRARY_DAZZLE);
	Linker.link(dzl_empty_state_get_icon_name, "dzl_empty_state_get_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_empty_state_get_subtitle, "dzl_empty_state_get_subtitle", LIBRARY_DAZZLE);
	Linker.link(dzl_empty_state_get_title, "dzl_empty_state_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_empty_state_set_icon_name, "dzl_empty_state_set_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_empty_state_set_resource, "dzl_empty_state_set_resource", LIBRARY_DAZZLE);
	Linker.link(dzl_empty_state_set_subtitle, "dzl_empty_state_set_subtitle", LIBRARY_DAZZLE);
	Linker.link(dzl_empty_state_set_title, "dzl_empty_state_set_title", LIBRARY_DAZZLE);

	// dazzle.EntryBox

	Linker.link(dzl_entry_box_get_type, "dzl_entry_box_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_entry_box_new, "dzl_entry_box_new", LIBRARY_DAZZLE);

	// dazzle.FileChooserEntry

	Linker.link(dzl_file_chooser_entry_get_type, "dzl_file_chooser_entry_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_file_chooser_entry_new, "dzl_file_chooser_entry_new", LIBRARY_DAZZLE);
	Linker.link(dzl_file_chooser_entry_get_entry, "dzl_file_chooser_entry_get_entry", LIBRARY_DAZZLE);
	Linker.link(dzl_file_chooser_entry_get_file, "dzl_file_chooser_entry_get_file", LIBRARY_DAZZLE);
	Linker.link(dzl_file_chooser_entry_set_file, "dzl_file_chooser_entry_set_file", LIBRARY_DAZZLE);

	// dazzle.FileTransfer

	Linker.link(dzl_file_transfer_get_type, "dzl_file_transfer_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_new, "dzl_file_transfer_new", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_add, "dzl_file_transfer_add", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_execute, "dzl_file_transfer_execute", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_execute_async, "dzl_file_transfer_execute_async", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_execute_finish, "dzl_file_transfer_execute_finish", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_get_flags, "dzl_file_transfer_get_flags", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_get_progress, "dzl_file_transfer_get_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_set_flags, "dzl_file_transfer_set_flags", LIBRARY_DAZZLE);
	Linker.link(dzl_file_transfer_stat, "dzl_file_transfer_stat", LIBRARY_DAZZLE);

	// dazzle.FuzzyIndex

	Linker.link(dzl_fuzzy_index_get_type, "dzl_fuzzy_index_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_new, "dzl_fuzzy_index_new", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_get_metadata, "dzl_fuzzy_index_get_metadata", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_get_metadata_string, "dzl_fuzzy_index_get_metadata_string", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_get_metadata_uint32, "dzl_fuzzy_index_get_metadata_uint32", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_get_metadata_uint64, "dzl_fuzzy_index_get_metadata_uint64", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_load_file, "dzl_fuzzy_index_load_file", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_load_file_async, "dzl_fuzzy_index_load_file_async", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_load_file_finish, "dzl_fuzzy_index_load_file_finish", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_query_async, "dzl_fuzzy_index_query_async", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_query_finish, "dzl_fuzzy_index_query_finish", LIBRARY_DAZZLE);

	// dazzle.FuzzyIndexBuilder

	Linker.link(dzl_fuzzy_index_builder_get_type, "dzl_fuzzy_index_builder_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_new, "dzl_fuzzy_index_builder_new", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_get_case_sensitive, "dzl_fuzzy_index_builder_get_case_sensitive", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_get_document, "dzl_fuzzy_index_builder_get_document", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_insert, "dzl_fuzzy_index_builder_insert", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_set_case_sensitive, "dzl_fuzzy_index_builder_set_case_sensitive", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_set_metadata, "dzl_fuzzy_index_builder_set_metadata", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_set_metadata_string, "dzl_fuzzy_index_builder_set_metadata_string", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_set_metadata_uint32, "dzl_fuzzy_index_builder_set_metadata_uint32", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_set_metadata_uint64, "dzl_fuzzy_index_builder_set_metadata_uint64", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_write, "dzl_fuzzy_index_builder_write", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_write_async, "dzl_fuzzy_index_builder_write_async", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_builder_write_finish, "dzl_fuzzy_index_builder_write_finish", LIBRARY_DAZZLE);

	// dazzle.FuzzyIndexCursor

	Linker.link(dzl_fuzzy_index_cursor_get_type, "dzl_fuzzy_index_cursor_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_cursor_get_index, "dzl_fuzzy_index_cursor_get_index", LIBRARY_DAZZLE);

	// dazzle.FuzzyIndexMatch

	Linker.link(dzl_fuzzy_index_match_get_type, "dzl_fuzzy_index_match_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_match_get_document, "dzl_fuzzy_index_match_get_document", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_match_get_key, "dzl_fuzzy_index_match_get_key", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_match_get_priority, "dzl_fuzzy_index_match_get_priority", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_index_match_get_score, "dzl_fuzzy_index_match_get_score", LIBRARY_DAZZLE);

	// dazzle.FuzzyMutableIndex

	Linker.link(dzl_fuzzy_mutable_index_get_type, "dzl_fuzzy_mutable_index_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_new, "dzl_fuzzy_mutable_index_new", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_new_with_free_func, "dzl_fuzzy_mutable_index_new_with_free_func", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_begin_bulk_insert, "dzl_fuzzy_mutable_index_begin_bulk_insert", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_contains, "dzl_fuzzy_mutable_index_contains", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_end_bulk_insert, "dzl_fuzzy_mutable_index_end_bulk_insert", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_insert, "dzl_fuzzy_mutable_index_insert", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_match, "dzl_fuzzy_mutable_index_match", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_ref, "dzl_fuzzy_mutable_index_ref", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_remove, "dzl_fuzzy_mutable_index_remove", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_set_free_func, "dzl_fuzzy_mutable_index_set_free_func", LIBRARY_DAZZLE);
	Linker.link(dzl_fuzzy_mutable_index_unref, "dzl_fuzzy_mutable_index_unref", LIBRARY_DAZZLE);

	// dazzle.GraphColumn

	Linker.link(dzl_graph_view_column_get_type, "dzl_graph_view_column_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_column_new, "dzl_graph_view_column_new", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_column_get_name, "dzl_graph_view_column_get_name", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_column_set_name, "dzl_graph_view_column_set_name", LIBRARY_DAZZLE);

	// dazzle.GraphLineRenderer

	Linker.link(dzl_graph_view_line_renderer_get_type, "dzl_graph_view_line_renderer_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_line_renderer_new, "dzl_graph_view_line_renderer_new", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_line_renderer_get_stroke_color_rgba, "dzl_graph_view_line_renderer_get_stroke_color_rgba", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_line_renderer_set_stroke_color, "dzl_graph_view_line_renderer_set_stroke_color", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_line_renderer_set_stroke_color_rgba, "dzl_graph_view_line_renderer_set_stroke_color_rgba", LIBRARY_DAZZLE);

	// dazzle.GraphModel

	Linker.link(dzl_graph_view_model_get_type, "dzl_graph_view_model_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_new, "dzl_graph_view_model_new", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_iter_get, "dzl_graph_view_model_iter_get", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_iter_get_timestamp, "dzl_graph_view_model_iter_get_timestamp", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_iter_get_value, "dzl_graph_view_model_iter_get_value", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_iter_next, "dzl_graph_view_model_iter_next", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_iter_set, "dzl_graph_view_model_iter_set", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_iter_set_value, "dzl_graph_view_model_iter_set_value", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_add_column, "dzl_graph_view_model_add_column", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_get_end_time, "dzl_graph_view_model_get_end_time", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_get_iter_first, "dzl_graph_view_model_get_iter_first", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_get_iter_last, "dzl_graph_view_model_get_iter_last", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_get_max_samples, "dzl_graph_view_model_get_max_samples", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_get_n_columns, "dzl_graph_view_model_get_n_columns", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_get_timespan, "dzl_graph_view_model_get_timespan", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_push, "dzl_graph_view_model_push", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_set_max_samples, "dzl_graph_view_model_set_max_samples", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_model_set_timespan, "dzl_graph_view_model_set_timespan", LIBRARY_DAZZLE);

	// dazzle.GraphRenderer

	Linker.link(dzl_graph_view_renderer_get_type, "dzl_graph_view_renderer_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_renderer_render, "dzl_graph_view_renderer_render", LIBRARY_DAZZLE);

	// dazzle.GraphView

	Linker.link(dzl_graph_view_get_type, "dzl_graph_view_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_new, "dzl_graph_view_new", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_add_renderer, "dzl_graph_view_add_renderer", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_get_model, "dzl_graph_view_get_model", LIBRARY_DAZZLE);
	Linker.link(dzl_graph_view_set_model, "dzl_graph_view_set_model", LIBRARY_DAZZLE);

	// dazzle.Heap

	Linker.link(dzl_heap_get_type, "dzl_heap_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_heap_new, "dzl_heap_new", LIBRARY_DAZZLE);
	Linker.link(dzl_heap_extract, "dzl_heap_extract", LIBRARY_DAZZLE);
	Linker.link(dzl_heap_extract_index, "dzl_heap_extract_index", LIBRARY_DAZZLE);
	Linker.link(dzl_heap_insert_vals, "dzl_heap_insert_vals", LIBRARY_DAZZLE);
	Linker.link(dzl_heap_ref, "dzl_heap_ref", LIBRARY_DAZZLE);
	Linker.link(dzl_heap_unref, "dzl_heap_unref", LIBRARY_DAZZLE);

	// dazzle.JoinedMenu

	Linker.link(dzl_joined_menu_get_type, "dzl_joined_menu_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_joined_menu_new, "dzl_joined_menu_new", LIBRARY_DAZZLE);
	Linker.link(dzl_joined_menu_append_menu, "dzl_joined_menu_append_menu", LIBRARY_DAZZLE);
	Linker.link(dzl_joined_menu_get_n_joined, "dzl_joined_menu_get_n_joined", LIBRARY_DAZZLE);
	Linker.link(dzl_joined_menu_prepend_menu, "dzl_joined_menu_prepend_menu", LIBRARY_DAZZLE);
	Linker.link(dzl_joined_menu_remove_index, "dzl_joined_menu_remove_index", LIBRARY_DAZZLE);
	Linker.link(dzl_joined_menu_remove_menu, "dzl_joined_menu_remove_menu", LIBRARY_DAZZLE);

	// dazzle.ListBox

	Linker.link(dzl_list_box_get_type, "dzl_list_box_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_list_box_new, "dzl_list_box_new", LIBRARY_DAZZLE);
	Linker.link(dzl_list_box_get_model, "dzl_list_box_get_model", LIBRARY_DAZZLE);
	Linker.link(dzl_list_box_get_property_name, "dzl_list_box_get_property_name", LIBRARY_DAZZLE);
	Linker.link(dzl_list_box_get_row_type, "dzl_list_box_get_row_type", LIBRARY_DAZZLE);
	Linker.link(dzl_list_box_set_model, "dzl_list_box_set_model", LIBRARY_DAZZLE);
	Linker.link(dzl_list_box_set_recycle_max, "dzl_list_box_set_recycle_max", LIBRARY_DAZZLE);

	// dazzle.ListBoxRow

	Linker.link(dzl_list_box_row_get_type, "dzl_list_box_row_get_type", LIBRARY_DAZZLE);

	// dazzle.ListModelFilter

	Linker.link(dzl_list_model_filter_get_type, "dzl_list_model_filter_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_list_model_filter_new, "dzl_list_model_filter_new", LIBRARY_DAZZLE);
	Linker.link(dzl_list_model_filter_get_child_model, "dzl_list_model_filter_get_child_model", LIBRARY_DAZZLE);
	Linker.link(dzl_list_model_filter_invalidate, "dzl_list_model_filter_invalidate", LIBRARY_DAZZLE);
	Linker.link(dzl_list_model_filter_set_filter_func, "dzl_list_model_filter_set_filter_func", LIBRARY_DAZZLE);

	// dazzle.ListStoreAdapter

	Linker.link(dzl_list_store_adapter_get_type, "dzl_list_store_adapter_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_list_store_adapter_new, "dzl_list_store_adapter_new", LIBRARY_DAZZLE);
	Linker.link(dzl_list_store_adapter_get_model, "dzl_list_store_adapter_get_model", LIBRARY_DAZZLE);
	Linker.link(dzl_list_store_adapter_set_model, "dzl_list_store_adapter_set_model", LIBRARY_DAZZLE);

	// dazzle.MenuButton

	Linker.link(dzl_menu_button_get_type, "dzl_menu_button_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_new_with_model, "dzl_menu_button_new_with_model", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_get_model, "dzl_menu_button_get_model", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_get_show_accels, "dzl_menu_button_get_show_accels", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_get_show_arrow, "dzl_menu_button_get_show_arrow", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_get_show_icons, "dzl_menu_button_get_show_icons", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_set_model, "dzl_menu_button_set_model", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_set_show_accels, "dzl_menu_button_set_show_accels", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_set_show_arrow, "dzl_menu_button_set_show_arrow", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_button_set_show_icons, "dzl_menu_button_set_show_icons", LIBRARY_DAZZLE);

	// dazzle.MenuManager

	Linker.link(dzl_menu_manager_get_type, "dzl_menu_manager_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_manager_new, "dzl_menu_manager_new", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_manager_add_filename, "dzl_menu_manager_add_filename", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_manager_add_resource, "dzl_menu_manager_add_resource", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_manager_get_menu_by_id, "dzl_menu_manager_get_menu_by_id", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_manager_merge, "dzl_menu_manager_merge", LIBRARY_DAZZLE);
	Linker.link(dzl_menu_manager_remove, "dzl_menu_manager_remove", LIBRARY_DAZZLE);

	// dazzle.MultiPaned

	Linker.link(dzl_multi_paned_get_type, "dzl_multi_paned_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_multi_paned_new, "dzl_multi_paned_new", LIBRARY_DAZZLE);
	Linker.link(dzl_multi_paned_get_at_point, "dzl_multi_paned_get_at_point", LIBRARY_DAZZLE);
	Linker.link(dzl_multi_paned_get_n_children, "dzl_multi_paned_get_n_children", LIBRARY_DAZZLE);
	Linker.link(dzl_multi_paned_get_nth_child, "dzl_multi_paned_get_nth_child", LIBRARY_DAZZLE);

	// dazzle.Path

	Linker.link(dzl_path_get_type, "dzl_path_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_path_new, "dzl_path_new", LIBRARY_DAZZLE);
	Linker.link(dzl_path_append, "dzl_path_append", LIBRARY_DAZZLE);
	Linker.link(dzl_path_get_element, "dzl_path_get_element", LIBRARY_DAZZLE);
	Linker.link(dzl_path_get_elements, "dzl_path_get_elements", LIBRARY_DAZZLE);
	Linker.link(dzl_path_get_length, "dzl_path_get_length", LIBRARY_DAZZLE);
	Linker.link(dzl_path_has_prefix, "dzl_path_has_prefix", LIBRARY_DAZZLE);
	Linker.link(dzl_path_is_empty, "dzl_path_is_empty", LIBRARY_DAZZLE);
	Linker.link(dzl_path_prepend, "dzl_path_prepend", LIBRARY_DAZZLE);
	Linker.link(dzl_path_printf, "dzl_path_printf", LIBRARY_DAZZLE);

	// dazzle.PathBar

	Linker.link(dzl_path_bar_get_type, "dzl_path_bar_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_path_bar_new, "dzl_path_bar_new", LIBRARY_DAZZLE);
	Linker.link(dzl_path_bar_get_path, "dzl_path_bar_get_path", LIBRARY_DAZZLE);
	Linker.link(dzl_path_bar_set_path, "dzl_path_bar_set_path", LIBRARY_DAZZLE);
	Linker.link(dzl_path_bar_set_selected_index, "dzl_path_bar_set_selected_index", LIBRARY_DAZZLE);

	// dazzle.PathElement

	Linker.link(dzl_path_element_get_type, "dzl_path_element_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_path_element_new, "dzl_path_element_new", LIBRARY_DAZZLE);
	Linker.link(dzl_path_element_get_icon_name, "dzl_path_element_get_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_path_element_get_id, "dzl_path_element_get_id", LIBRARY_DAZZLE);
	Linker.link(dzl_path_element_get_title, "dzl_path_element_get_title", LIBRARY_DAZZLE);

	// dazzle.PatternSpec

	Linker.link(dzl_pattern_spec_get_type, "dzl_pattern_spec_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_pattern_spec_new, "dzl_pattern_spec_new", LIBRARY_DAZZLE);
	Linker.link(dzl_pattern_spec_get_text, "dzl_pattern_spec_get_text", LIBRARY_DAZZLE);
	Linker.link(dzl_pattern_spec_match, "dzl_pattern_spec_match", LIBRARY_DAZZLE);
	Linker.link(dzl_pattern_spec_ref, "dzl_pattern_spec_ref", LIBRARY_DAZZLE);
	Linker.link(dzl_pattern_spec_unref, "dzl_pattern_spec_unref", LIBRARY_DAZZLE);

	// dazzle.PillBox

	Linker.link(dzl_pill_box_get_type, "dzl_pill_box_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_pill_box_new, "dzl_pill_box_new", LIBRARY_DAZZLE);
	Linker.link(dzl_pill_box_get_label, "dzl_pill_box_get_label", LIBRARY_DAZZLE);
	Linker.link(dzl_pill_box_set_label, "dzl_pill_box_set_label", LIBRARY_DAZZLE);

	// dazzle.Preferences

	Linker.link(dzl_preferences_get_type, "dzl_preferences_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_custom, "dzl_preferences_add_custom", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_file_chooser, "dzl_preferences_add_file_chooser", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_font_button, "dzl_preferences_add_font_button", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_group, "dzl_preferences_add_group", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_list_group, "dzl_preferences_add_list_group", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_page, "dzl_preferences_add_page", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_radio, "dzl_preferences_add_radio", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_spin_button, "dzl_preferences_add_spin_button", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_switch, "dzl_preferences_add_switch", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_add_table_row, "dzl_preferences_add_table_row", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_get_widget, "dzl_preferences_get_widget", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_remove_id, "dzl_preferences_remove_id", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_set_page, "dzl_preferences_set_page", LIBRARY_DAZZLE);

	// dazzle.PreferencesBin

	Linker.link(dzl_preferences_bin_get_type, "dzl_preferences_bin_get_type", LIBRARY_DAZZLE);

	// dazzle.PreferencesEntry

	Linker.link(dzl_preferences_entry_get_type, "dzl_preferences_entry_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_entry_get_entry_widget, "dzl_preferences_entry_get_entry_widget", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_entry_get_title_widget, "dzl_preferences_entry_get_title_widget", LIBRARY_DAZZLE);

	// dazzle.PreferencesFileChooserButton

	Linker.link(dzl_preferences_file_chooser_button_get_type, "dzl_preferences_file_chooser_button_get_type", LIBRARY_DAZZLE);

	// dazzle.PreferencesFlowBox

	Linker.link(dzl_preferences_flow_box_get_type, "dzl_preferences_flow_box_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_flow_box_new, "dzl_preferences_flow_box_new", LIBRARY_DAZZLE);

	// dazzle.PreferencesFontButton

	Linker.link(dzl_preferences_font_button_get_type, "dzl_preferences_font_button_get_type", LIBRARY_DAZZLE);

	// dazzle.PreferencesGroup

	Linker.link(dzl_preferences_group_get_type, "dzl_preferences_group_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_group_add, "dzl_preferences_group_add", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_group_get_priority, "dzl_preferences_group_get_priority", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_group_get_size_group, "dzl_preferences_group_get_size_group", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_group_get_title, "dzl_preferences_group_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_group_refilter, "dzl_preferences_group_refilter", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_group_set_map, "dzl_preferences_group_set_map", LIBRARY_DAZZLE);

	// dazzle.PreferencesPage

	Linker.link(dzl_preferences_page_get_type, "dzl_preferences_page_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_page_add_group, "dzl_preferences_page_add_group", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_page_get_group, "dzl_preferences_page_get_group", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_page_refilter, "dzl_preferences_page_refilter", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_page_set_map, "dzl_preferences_page_set_map", LIBRARY_DAZZLE);

	// dazzle.PreferencesSpinButton

	Linker.link(dzl_preferences_spin_button_get_type, "dzl_preferences_spin_button_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_spin_button_get_spin_button, "dzl_preferences_spin_button_get_spin_button", LIBRARY_DAZZLE);

	// dazzle.PreferencesSwitch

	Linker.link(dzl_preferences_switch_get_type, "dzl_preferences_switch_get_type", LIBRARY_DAZZLE);

	// dazzle.PreferencesView

	Linker.link(dzl_preferences_view_get_type, "dzl_preferences_view_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_view_new, "dzl_preferences_view_new", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_view_get_show_search_entry, "dzl_preferences_view_get_show_search_entry", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_view_get_use_sidebar, "dzl_preferences_view_get_use_sidebar", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_view_reapply_filter, "dzl_preferences_view_reapply_filter", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_view_set_show_search_entry, "dzl_preferences_view_set_show_search_entry", LIBRARY_DAZZLE);
	Linker.link(dzl_preferences_view_set_use_sidebar, "dzl_preferences_view_set_use_sidebar", LIBRARY_DAZZLE);

	// dazzle.PriorityBox

	Linker.link(dzl_priority_box_get_type, "dzl_priority_box_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_priority_box_new, "dzl_priority_box_new", LIBRARY_DAZZLE);

	// dazzle.ProgressButton

	Linker.link(dzl_progress_button_get_type, "dzl_progress_button_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_button_new, "dzl_progress_button_new", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_button_get_progress, "dzl_progress_button_get_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_button_get_show_progress, "dzl_progress_button_get_show_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_button_set_progress, "dzl_progress_button_set_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_button_set_show_progress, "dzl_progress_button_set_show_progress", LIBRARY_DAZZLE);

	// dazzle.ProgressIcon

	Linker.link(dzl_progress_icon_get_type, "dzl_progress_icon_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_icon_new, "dzl_progress_icon_new", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_icon_get_progress, "dzl_progress_icon_get_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_icon_set_progress, "dzl_progress_icon_set_progress", LIBRARY_DAZZLE);

	// dazzle.ProgressMenuButton

	Linker.link(dzl_progress_menu_button_get_type, "dzl_progress_menu_button_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_menu_button_new, "dzl_progress_menu_button_new", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_menu_button_get_progress, "dzl_progress_menu_button_get_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_menu_button_get_show_progress, "dzl_progress_menu_button_get_show_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_menu_button_get_show_theatric, "dzl_progress_menu_button_get_show_theatric", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_menu_button_reset_theatrics, "dzl_progress_menu_button_reset_theatrics", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_menu_button_set_progress, "dzl_progress_menu_button_set_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_menu_button_set_show_progress, "dzl_progress_menu_button_set_show_progress", LIBRARY_DAZZLE);
	Linker.link(dzl_progress_menu_button_set_show_theatric, "dzl_progress_menu_button_set_show_theatric", LIBRARY_DAZZLE);

	// dazzle.PropertiesGroup

	Linker.link(dzl_properties_group_get_type, "dzl_properties_group_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_properties_group_new, "dzl_properties_group_new", LIBRARY_DAZZLE);
	Linker.link(dzl_properties_group_new_for_type, "dzl_properties_group_new_for_type", LIBRARY_DAZZLE);
	Linker.link(dzl_properties_group_add_all_properties, "dzl_properties_group_add_all_properties", LIBRARY_DAZZLE);
	Linker.link(dzl_properties_group_add_property, "dzl_properties_group_add_property", LIBRARY_DAZZLE);
	Linker.link(dzl_properties_group_add_property_full, "dzl_properties_group_add_property_full", LIBRARY_DAZZLE);
	Linker.link(dzl_properties_group_remove, "dzl_properties_group_remove", LIBRARY_DAZZLE);

	// dazzle.RadioBox

	Linker.link(dzl_radio_box_get_type, "dzl_radio_box_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_radio_box_new, "dzl_radio_box_new", LIBRARY_DAZZLE);
	Linker.link(dzl_radio_box_add_item, "dzl_radio_box_add_item", LIBRARY_DAZZLE);
	Linker.link(dzl_radio_box_get_active_id, "dzl_radio_box_get_active_id", LIBRARY_DAZZLE);
	Linker.link(dzl_radio_box_remove_item, "dzl_radio_box_remove_item", LIBRARY_DAZZLE);
	Linker.link(dzl_radio_box_set_active_id, "dzl_radio_box_set_active_id", LIBRARY_DAZZLE);

	// dazzle.ReadOnlyListModel

	Linker.link(dzl_read_only_list_model_get_type, "dzl_read_only_list_model_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_read_only_list_model_new, "dzl_read_only_list_model_new", LIBRARY_DAZZLE);

	// dazzle.RecursiveFileMonitor

	Linker.link(dzl_recursive_file_monitor_get_type, "dzl_recursive_file_monitor_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_recursive_file_monitor_new, "dzl_recursive_file_monitor_new", LIBRARY_DAZZLE);
	Linker.link(dzl_recursive_file_monitor_cancel, "dzl_recursive_file_monitor_cancel", LIBRARY_DAZZLE);
	Linker.link(dzl_recursive_file_monitor_get_root, "dzl_recursive_file_monitor_get_root", LIBRARY_DAZZLE);
	Linker.link(dzl_recursive_file_monitor_set_ignore_func, "dzl_recursive_file_monitor_set_ignore_func", LIBRARY_DAZZLE);
	Linker.link(dzl_recursive_file_monitor_start_async, "dzl_recursive_file_monitor_start_async", LIBRARY_DAZZLE);
	Linker.link(dzl_recursive_file_monitor_start_finish, "dzl_recursive_file_monitor_start_finish", LIBRARY_DAZZLE);

	// dazzle.Ring

	Linker.link(dzl_ring_get_type, "dzl_ring_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_ring_sized_new, "dzl_ring_sized_new", LIBRARY_DAZZLE);
	Linker.link(dzl_ring_append_vals, "dzl_ring_append_vals", LIBRARY_DAZZLE);
	Linker.link(dzl_ring_foreach, "dzl_ring_foreach", LIBRARY_DAZZLE);
	Linker.link(dzl_ring_ref, "dzl_ring_ref", LIBRARY_DAZZLE);
	Linker.link(dzl_ring_unref, "dzl_ring_unref", LIBRARY_DAZZLE);

	// dazzle.ScrolledWindow

	Linker.link(dzl_scrolled_window_get_type, "dzl_scrolled_window_get_type", LIBRARY_DAZZLE);

	// dazzle.SearchBar

	Linker.link(dzl_search_bar_get_type, "dzl_search_bar_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_search_bar_new, "dzl_search_bar_new", LIBRARY_DAZZLE);
	Linker.link(dzl_search_bar_get_entry, "dzl_search_bar_get_entry", LIBRARY_DAZZLE);
	Linker.link(dzl_search_bar_get_search_mode_enabled, "dzl_search_bar_get_search_mode_enabled", LIBRARY_DAZZLE);
	Linker.link(dzl_search_bar_get_show_close_button, "dzl_search_bar_get_show_close_button", LIBRARY_DAZZLE);
	Linker.link(dzl_search_bar_set_search_mode_enabled, "dzl_search_bar_set_search_mode_enabled", LIBRARY_DAZZLE);
	Linker.link(dzl_search_bar_set_show_close_button, "dzl_search_bar_set_show_close_button", LIBRARY_DAZZLE);

	// dazzle.SettingsFlagAction

	Linker.link(dzl_settings_flag_action_get_type, "dzl_settings_flag_action_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_flag_action_new, "dzl_settings_flag_action_new", LIBRARY_DAZZLE);

	// dazzle.SettingsSandwich

	Linker.link(dzl_settings_sandwich_get_type, "dzl_settings_sandwich_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_new, "dzl_settings_sandwich_new", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_append, "dzl_settings_sandwich_append", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_bind, "dzl_settings_sandwich_bind", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_bind_with_mapping, "dzl_settings_sandwich_bind_with_mapping", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_get_boolean, "dzl_settings_sandwich_get_boolean", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_get_default_value, "dzl_settings_sandwich_get_default_value", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_get_double, "dzl_settings_sandwich_get_double", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_get_int, "dzl_settings_sandwich_get_int", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_get_string, "dzl_settings_sandwich_get_string", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_get_uint, "dzl_settings_sandwich_get_uint", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_get_user_value, "dzl_settings_sandwich_get_user_value", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_get_value, "dzl_settings_sandwich_get_value", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_set_boolean, "dzl_settings_sandwich_set_boolean", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_set_double, "dzl_settings_sandwich_set_double", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_set_int, "dzl_settings_sandwich_set_int", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_set_string, "dzl_settings_sandwich_set_string", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_set_uint, "dzl_settings_sandwich_set_uint", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_set_value, "dzl_settings_sandwich_set_value", LIBRARY_DAZZLE);
	Linker.link(dzl_settings_sandwich_unbind, "dzl_settings_sandwich_unbind", LIBRARY_DAZZLE);

	// dazzle.ShortcutAccelDialog

	Linker.link(dzl_shortcut_accel_dialog_get_type, "dzl_shortcut_accel_dialog_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_accel_dialog_new, "dzl_shortcut_accel_dialog_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_accel_dialog_get_accelerator, "dzl_shortcut_accel_dialog_get_accelerator", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_accel_dialog_get_chord, "dzl_shortcut_accel_dialog_get_chord", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_accel_dialog_get_shortcut_title, "dzl_shortcut_accel_dialog_get_shortcut_title", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_accel_dialog_set_accelerator, "dzl_shortcut_accel_dialog_set_accelerator", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_accel_dialog_set_shortcut_title, "dzl_shortcut_accel_dialog_set_shortcut_title", LIBRARY_DAZZLE);

	// dazzle.ShortcutChord

	Linker.link(dzl_shortcut_chord_get_type, "dzl_shortcut_chord_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_new_from_event, "dzl_shortcut_chord_new_from_event", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_new_from_string, "dzl_shortcut_chord_new_from_string", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_append_event, "dzl_shortcut_chord_append_event", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_copy, "dzl_shortcut_chord_copy", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_free, "dzl_shortcut_chord_free", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_get_label, "dzl_shortcut_chord_get_label", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_get_length, "dzl_shortcut_chord_get_length", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_get_nth_key, "dzl_shortcut_chord_get_nth_key", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_has_modifier, "dzl_shortcut_chord_has_modifier", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_match, "dzl_shortcut_chord_match", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_to_string, "dzl_shortcut_chord_to_string", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_equal, "dzl_shortcut_chord_equal", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_hash, "dzl_shortcut_chord_hash", LIBRARY_DAZZLE);

	// dazzle.ShortcutChordTable

	Linker.link(dzl_shortcut_chord_table_add, "dzl_shortcut_chord_table_add", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_foreach, "dzl_shortcut_chord_table_foreach", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_free, "dzl_shortcut_chord_table_free", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_lookup, "dzl_shortcut_chord_table_lookup", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_lookup_data, "dzl_shortcut_chord_table_lookup_data", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_printf, "dzl_shortcut_chord_table_printf", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_remove, "dzl_shortcut_chord_table_remove", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_remove_data, "dzl_shortcut_chord_table_remove_data", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_set_free_func, "dzl_shortcut_chord_table_set_free_func", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_size, "dzl_shortcut_chord_table_size", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_chord_table_new, "dzl_shortcut_chord_table_new", LIBRARY_DAZZLE);

	// dazzle.ShortcutContext

	Linker.link(dzl_shortcut_context_get_type, "dzl_shortcut_context_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_new, "dzl_shortcut_context_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_activate, "dzl_shortcut_context_activate", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_add_action, "dzl_shortcut_context_add_action", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_add_command, "dzl_shortcut_context_add_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_add_signal, "dzl_shortcut_context_add_signal", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_add_signal_va_list, "dzl_shortcut_context_add_signal_va_list", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_add_signalv, "dzl_shortcut_context_add_signalv", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_get_name, "dzl_shortcut_context_get_name", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_load_from_data, "dzl_shortcut_context_load_from_data", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_load_from_resource, "dzl_shortcut_context_load_from_resource", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_context_remove, "dzl_shortcut_context_remove", LIBRARY_DAZZLE);

	// dazzle.ShortcutController

	Linker.link(dzl_shortcut_controller_get_type, "dzl_shortcut_controller_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_new, "dzl_shortcut_controller_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_find, "dzl_shortcut_controller_find", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_try_find, "dzl_shortcut_controller_try_find", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_add_command_action, "dzl_shortcut_controller_add_command_action", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_add_command_callback, "dzl_shortcut_controller_add_command_callback", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_add_command_signal, "dzl_shortcut_controller_add_command_signal", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_execute_command, "dzl_shortcut_controller_execute_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_get_context, "dzl_shortcut_controller_get_context", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_get_context_for_phase, "dzl_shortcut_controller_get_context_for_phase", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_get_current_chord, "dzl_shortcut_controller_get_current_chord", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_get_manager, "dzl_shortcut_controller_get_manager", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_get_widget, "dzl_shortcut_controller_get_widget", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_remove_accel, "dzl_shortcut_controller_remove_accel", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_set_context_by_name, "dzl_shortcut_controller_set_context_by_name", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_controller_set_manager, "dzl_shortcut_controller_set_manager", LIBRARY_DAZZLE);

	// dazzle.ShortcutLabel

	Linker.link(dzl_shortcut_label_get_type, "dzl_shortcut_label_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_label_new, "dzl_shortcut_label_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_label_get_accelerator, "dzl_shortcut_label_get_accelerator", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_label_get_chord, "dzl_shortcut_label_get_chord", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_label_set_accelerator, "dzl_shortcut_label_set_accelerator", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_label_set_chord, "dzl_shortcut_label_set_chord", LIBRARY_DAZZLE);

	// dazzle.ShortcutManager

	Linker.link(dzl_shortcut_manager_get_type, "dzl_shortcut_manager_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_get_default, "dzl_shortcut_manager_get_default", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_add_action, "dzl_shortcut_manager_add_action", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_add_command, "dzl_shortcut_manager_add_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_add_shortcut_entries, "dzl_shortcut_manager_add_shortcut_entries", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_add_shortcuts_to_window, "dzl_shortcut_manager_add_shortcuts_to_window", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_append_search_path, "dzl_shortcut_manager_append_search_path", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_get_theme, "dzl_shortcut_manager_get_theme", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_get_theme_by_name, "dzl_shortcut_manager_get_theme_by_name", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_get_theme_name, "dzl_shortcut_manager_get_theme_name", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_get_user_dir, "dzl_shortcut_manager_get_user_dir", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_handle_event, "dzl_shortcut_manager_handle_event", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_prepend_search_path, "dzl_shortcut_manager_prepend_search_path", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_queue_reload, "dzl_shortcut_manager_queue_reload", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_reload, "dzl_shortcut_manager_reload", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_remove_search_path, "dzl_shortcut_manager_remove_search_path", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_set_theme, "dzl_shortcut_manager_set_theme", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_set_theme_name, "dzl_shortcut_manager_set_theme_name", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_manager_set_user_dir, "dzl_shortcut_manager_set_user_dir", LIBRARY_DAZZLE);

	// dazzle.ShortcutModel

	Linker.link(dzl_shortcut_model_get_type, "dzl_shortcut_model_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_model_new, "dzl_shortcut_model_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_model_get_manager, "dzl_shortcut_model_get_manager", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_model_get_theme, "dzl_shortcut_model_get_theme", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_model_rebuild, "dzl_shortcut_model_rebuild", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_model_set_chord, "dzl_shortcut_model_set_chord", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_model_set_manager, "dzl_shortcut_model_set_manager", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_model_set_theme, "dzl_shortcut_model_set_theme", LIBRARY_DAZZLE);

	// dazzle.ShortcutSimpleLabel

	Linker.link(dzl_shortcut_simple_label_get_type, "dzl_shortcut_simple_label_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_new, "dzl_shortcut_simple_label_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_get_accel, "dzl_shortcut_simple_label_get_accel", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_get_action, "dzl_shortcut_simple_label_get_action", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_get_command, "dzl_shortcut_simple_label_get_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_get_title, "dzl_shortcut_simple_label_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_set_accel, "dzl_shortcut_simple_label_set_accel", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_set_action, "dzl_shortcut_simple_label_set_action", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_set_command, "dzl_shortcut_simple_label_set_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_simple_label_set_title, "dzl_shortcut_simple_label_set_title", LIBRARY_DAZZLE);

	// dazzle.ShortcutTheme

	Linker.link(dzl_shortcut_theme_get_type, "dzl_shortcut_theme_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_new, "dzl_shortcut_theme_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_add_command, "dzl_shortcut_theme_add_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_add_context, "dzl_shortcut_theme_add_context", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_add_css_resource, "dzl_shortcut_theme_add_css_resource", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_find_context_by_name, "dzl_shortcut_theme_find_context_by_name", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_find_default_context, "dzl_shortcut_theme_find_default_context", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_get_chord_for_action, "dzl_shortcut_theme_get_chord_for_action", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_get_chord_for_command, "dzl_shortcut_theme_get_chord_for_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_get_name, "dzl_shortcut_theme_get_name", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_get_parent, "dzl_shortcut_theme_get_parent", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_get_parent_name, "dzl_shortcut_theme_get_parent_name", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_get_subtitle, "dzl_shortcut_theme_get_subtitle", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_get_title, "dzl_shortcut_theme_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_load_from_data, "dzl_shortcut_theme_load_from_data", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_load_from_file, "dzl_shortcut_theme_load_from_file", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_load_from_path, "dzl_shortcut_theme_load_from_path", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_remove_css_resource, "dzl_shortcut_theme_remove_css_resource", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_save_to_file, "dzl_shortcut_theme_save_to_file", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_save_to_path, "dzl_shortcut_theme_save_to_path", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_save_to_stream, "dzl_shortcut_theme_save_to_stream", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_set_accel_for_action, "dzl_shortcut_theme_set_accel_for_action", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_set_accel_for_command, "dzl_shortcut_theme_set_accel_for_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_set_chord_for_action, "dzl_shortcut_theme_set_chord_for_action", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_set_chord_for_command, "dzl_shortcut_theme_set_chord_for_command", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_set_parent_name, "dzl_shortcut_theme_set_parent_name", LIBRARY_DAZZLE);

	// dazzle.ShortcutThemeEditor

	Linker.link(dzl_shortcut_theme_editor_get_type, "dzl_shortcut_theme_editor_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_editor_new, "dzl_shortcut_theme_editor_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_editor_get_theme, "dzl_shortcut_theme_editor_get_theme", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_theme_editor_set_theme, "dzl_shortcut_theme_editor_set_theme", LIBRARY_DAZZLE);

	// dazzle.ShortcutTooltip

	Linker.link(dzl_shortcut_tooltip_get_type, "dzl_shortcut_tooltip_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_new, "dzl_shortcut_tooltip_new", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_get_accel, "dzl_shortcut_tooltip_get_accel", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_get_command_id, "dzl_shortcut_tooltip_get_command_id", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_get_title, "dzl_shortcut_tooltip_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_get_widget, "dzl_shortcut_tooltip_get_widget", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_set_accel, "dzl_shortcut_tooltip_set_accel", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_set_command_id, "dzl_shortcut_tooltip_set_command_id", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_set_title, "dzl_shortcut_tooltip_set_title", LIBRARY_DAZZLE);
	Linker.link(dzl_shortcut_tooltip_set_widget, "dzl_shortcut_tooltip_set_widget", LIBRARY_DAZZLE);

	// dazzle.ShortcutsGroup

	Linker.link(dzl_shortcuts_group_get_type, "dzl_shortcuts_group_get_type", LIBRARY_DAZZLE);

	// dazzle.ShortcutsSection

	Linker.link(dzl_shortcuts_section_get_type, "dzl_shortcuts_section_get_type", LIBRARY_DAZZLE);

	// dazzle.ShortcutsShortcut

	Linker.link(dzl_shortcuts_shortcut_get_type, "dzl_shortcuts_shortcut_get_type", LIBRARY_DAZZLE);

	// dazzle.ShortcutsWindow

	Linker.link(dzl_shortcuts_window_get_type, "dzl_shortcuts_window_get_type", LIBRARY_DAZZLE);

	// dazzle.SignalGroup

	Linker.link(dzl_signal_group_get_type, "dzl_signal_group_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_new, "dzl_signal_group_new", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_block, "dzl_signal_group_block", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_connect, "dzl_signal_group_connect", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_connect_after, "dzl_signal_group_connect_after", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_connect_data, "dzl_signal_group_connect_data", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_connect_object, "dzl_signal_group_connect_object", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_connect_swapped, "dzl_signal_group_connect_swapped", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_get_target, "dzl_signal_group_get_target", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_set_target, "dzl_signal_group_set_target", LIBRARY_DAZZLE);
	Linker.link(dzl_signal_group_unblock, "dzl_signal_group_unblock", LIBRARY_DAZZLE);

	// dazzle.SimpleLabel

	Linker.link(dzl_simple_label_get_type, "dzl_simple_label_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_label_new, "dzl_simple_label_new", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_label_get_label, "dzl_simple_label_get_label", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_label_get_width_chars, "dzl_simple_label_get_width_chars", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_label_get_xalign, "dzl_simple_label_get_xalign", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_label_set_label, "dzl_simple_label_set_label", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_label_set_width_chars, "dzl_simple_label_set_width_chars", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_label_set_xalign, "dzl_simple_label_set_xalign", LIBRARY_DAZZLE);

	// dazzle.SimplePopover

	Linker.link(dzl_simple_popover_get_type, "dzl_simple_popover_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_new, "dzl_simple_popover_new", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_get_button_text, "dzl_simple_popover_get_button_text", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_get_message, "dzl_simple_popover_get_message", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_get_ready, "dzl_simple_popover_get_ready", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_get_text, "dzl_simple_popover_get_text", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_get_title, "dzl_simple_popover_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_set_button_text, "dzl_simple_popover_set_button_text", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_set_message, "dzl_simple_popover_set_message", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_set_ready, "dzl_simple_popover_set_ready", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_set_text, "dzl_simple_popover_set_text", LIBRARY_DAZZLE);
	Linker.link(dzl_simple_popover_set_title, "dzl_simple_popover_set_title", LIBRARY_DAZZLE);

	// dazzle.Slider

	Linker.link(dzl_slider_get_type, "dzl_slider_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_slider_new, "dzl_slider_new", LIBRARY_DAZZLE);
	Linker.link(dzl_slider_add_slider, "dzl_slider_add_slider", LIBRARY_DAZZLE);
	Linker.link(dzl_slider_get_position, "dzl_slider_get_position", LIBRARY_DAZZLE);
	Linker.link(dzl_slider_set_position, "dzl_slider_set_position", LIBRARY_DAZZLE);

	// dazzle.StackList

	Linker.link(dzl_stack_list_get_type, "dzl_stack_list_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_stack_list_new, "dzl_stack_list_new", LIBRARY_DAZZLE);
	Linker.link(dzl_stack_list_clear, "dzl_stack_list_clear", LIBRARY_DAZZLE);
	Linker.link(dzl_stack_list_get_depth, "dzl_stack_list_get_depth", LIBRARY_DAZZLE);
	Linker.link(dzl_stack_list_get_model, "dzl_stack_list_get_model", LIBRARY_DAZZLE);
	Linker.link(dzl_stack_list_pop, "dzl_stack_list_pop", LIBRARY_DAZZLE);
	Linker.link(dzl_stack_list_push, "dzl_stack_list_push", LIBRARY_DAZZLE);

	// dazzle.StateMachine

	Linker.link(dzl_state_machine_get_type, "dzl_state_machine_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_new, "dzl_state_machine_new", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_buildable_iface_init, "dzl_state_machine_buildable_iface_init", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_add_binding, "dzl_state_machine_add_binding", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_add_property, "dzl_state_machine_add_property", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_add_property_valist, "dzl_state_machine_add_property_valist", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_add_propertyv, "dzl_state_machine_add_propertyv", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_add_style, "dzl_state_machine_add_style", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_connect_object, "dzl_state_machine_connect_object", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_create_action, "dzl_state_machine_create_action", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_get_state, "dzl_state_machine_get_state", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_is_state, "dzl_state_machine_is_state", LIBRARY_DAZZLE);
	Linker.link(dzl_state_machine_set_state, "dzl_state_machine_set_state", LIBRARY_DAZZLE);

	// dazzle.Suggestion

	Linker.link(dzl_suggestion_get_type, "dzl_suggestion_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_new, "dzl_suggestion_new", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_get_icon, "dzl_suggestion_get_icon", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_get_icon_name, "dzl_suggestion_get_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_get_icon_surface, "dzl_suggestion_get_icon_surface", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_get_id, "dzl_suggestion_get_id", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_get_subtitle, "dzl_suggestion_get_subtitle", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_get_title, "dzl_suggestion_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_replace_typed_text, "dzl_suggestion_replace_typed_text", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_set_icon_name, "dzl_suggestion_set_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_set_id, "dzl_suggestion_set_id", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_set_subtitle, "dzl_suggestion_set_subtitle", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_set_title, "dzl_suggestion_set_title", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_suggest_suffix, "dzl_suggestion_suggest_suffix", LIBRARY_DAZZLE);

	// dazzle.SuggestionButton

	Linker.link(dzl_suggestion_button_get_type, "dzl_suggestion_button_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_button_new, "dzl_suggestion_button_new", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_button_get_button, "dzl_suggestion_button_get_button", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_button_get_entry, "dzl_suggestion_button_get_entry", LIBRARY_DAZZLE);

	// dazzle.SuggestionEntry

	Linker.link(dzl_suggestion_entry_get_type, "dzl_suggestion_entry_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_new, "dzl_suggestion_entry_new", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_default_position_func, "dzl_suggestion_entry_default_position_func", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_get_activate_on_single_click, "dzl_suggestion_entry_get_activate_on_single_click", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_get_compact, "dzl_suggestion_entry_get_compact", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_get_model, "dzl_suggestion_entry_get_model", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_get_popover, "dzl_suggestion_entry_get_popover", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_get_suggestion, "dzl_suggestion_entry_get_suggestion", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_get_typed_text, "dzl_suggestion_entry_get_typed_text", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_hide_suggestions, "dzl_suggestion_entry_hide_suggestions", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_set_activate_on_single_click, "dzl_suggestion_entry_set_activate_on_single_click", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_set_compact, "dzl_suggestion_entry_set_compact", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_set_model, "dzl_suggestion_entry_set_model", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_set_position_func, "dzl_suggestion_entry_set_position_func", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_set_suggestion, "dzl_suggestion_entry_set_suggestion", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_window_position_func, "dzl_suggestion_entry_window_position_func", LIBRARY_DAZZLE);

	// dazzle.SuggestionEntryBuffer

	Linker.link(dzl_suggestion_entry_buffer_get_type, "dzl_suggestion_entry_buffer_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_buffer_new, "dzl_suggestion_entry_buffer_new", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_buffer_clear, "dzl_suggestion_entry_buffer_clear", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_buffer_commit, "dzl_suggestion_entry_buffer_commit", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_buffer_get_suggestion, "dzl_suggestion_entry_buffer_get_suggestion", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_buffer_get_typed_length, "dzl_suggestion_entry_buffer_get_typed_length", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_buffer_get_typed_text, "dzl_suggestion_entry_buffer_get_typed_text", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_entry_buffer_set_suggestion, "dzl_suggestion_entry_buffer_set_suggestion", LIBRARY_DAZZLE);

	// dazzle.SuggestionPopover

	Linker.link(dzl_suggestion_popover_get_type, "dzl_suggestion_popover_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_new, "dzl_suggestion_popover_new", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_activate_selected, "dzl_suggestion_popover_activate_selected", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_get_model, "dzl_suggestion_popover_get_model", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_get_relative_to, "dzl_suggestion_popover_get_relative_to", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_get_selected, "dzl_suggestion_popover_get_selected", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_move_by, "dzl_suggestion_popover_move_by", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_popdown, "dzl_suggestion_popover_popdown", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_popup, "dzl_suggestion_popover_popup", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_set_model, "dzl_suggestion_popover_set_model", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_set_relative_to, "dzl_suggestion_popover_set_relative_to", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_popover_set_selected, "dzl_suggestion_popover_set_selected", LIBRARY_DAZZLE);

	// dazzle.SuggestionRow

	Linker.link(dzl_suggestion_row_get_type, "dzl_suggestion_row_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_row_new, "dzl_suggestion_row_new", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_row_get_suggestion, "dzl_suggestion_row_get_suggestion", LIBRARY_DAZZLE);
	Linker.link(dzl_suggestion_row_set_suggestion, "dzl_suggestion_row_set_suggestion", LIBRARY_DAZZLE);

	// dazzle.Tab

	Linker.link(dzl_tab_get_type, "dzl_tab_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_get_active, "dzl_tab_get_active", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_get_can_close, "dzl_tab_get_can_close", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_get_edge, "dzl_tab_get_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_get_icon_name, "dzl_tab_get_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_get_style, "dzl_tab_get_style", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_get_title, "dzl_tab_get_title", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_get_widget, "dzl_tab_get_widget", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_set_active, "dzl_tab_set_active", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_set_can_close, "dzl_tab_set_can_close", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_set_edge, "dzl_tab_set_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_set_gicon, "dzl_tab_set_gicon", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_set_icon_name, "dzl_tab_set_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_set_style, "dzl_tab_set_style", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_set_title, "dzl_tab_set_title", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_set_widget, "dzl_tab_set_widget", LIBRARY_DAZZLE);

	// dazzle.TabStrip

	Linker.link(dzl_tab_strip_get_type, "dzl_tab_strip_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_strip_new, "dzl_tab_strip_new", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_strip_add_control, "dzl_tab_strip_add_control", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_strip_get_edge, "dzl_tab_strip_get_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_strip_get_stack, "dzl_tab_strip_get_stack", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_strip_get_style, "dzl_tab_strip_get_style", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_strip_set_edge, "dzl_tab_strip_set_edge", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_strip_set_stack, "dzl_tab_strip_set_stack", LIBRARY_DAZZLE);
	Linker.link(dzl_tab_strip_set_style, "dzl_tab_strip_set_style", LIBRARY_DAZZLE);

	// dazzle.TaskCache

	Linker.link(dzl_task_cache_get_type, "dzl_task_cache_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_task_cache_new, "dzl_task_cache_new", LIBRARY_DAZZLE);
	Linker.link(dzl_task_cache_evict, "dzl_task_cache_evict", LIBRARY_DAZZLE);
	Linker.link(dzl_task_cache_evict_all, "dzl_task_cache_evict_all", LIBRARY_DAZZLE);
	Linker.link(dzl_task_cache_get_async, "dzl_task_cache_get_async", LIBRARY_DAZZLE);
	Linker.link(dzl_task_cache_get_finish, "dzl_task_cache_get_finish", LIBRARY_DAZZLE);
	Linker.link(dzl_task_cache_get_values, "dzl_task_cache_get_values", LIBRARY_DAZZLE);
	Linker.link(dzl_task_cache_peek, "dzl_task_cache_peek", LIBRARY_DAZZLE);
	Linker.link(dzl_task_cache_set_name, "dzl_task_cache_set_name", LIBRARY_DAZZLE);

	// dazzle.ThemeManager

	Linker.link(dzl_theme_manager_get_type, "dzl_theme_manager_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_theme_manager_new, "dzl_theme_manager_new", LIBRARY_DAZZLE);
	Linker.link(dzl_theme_manager_add_resources, "dzl_theme_manager_add_resources", LIBRARY_DAZZLE);
	Linker.link(dzl_theme_manager_remove_resources, "dzl_theme_manager_remove_resources", LIBRARY_DAZZLE);

	// dazzle.ThreeGrid

	Linker.link(dzl_three_grid_get_type, "dzl_three_grid_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_three_grid_new, "dzl_three_grid_new", LIBRARY_DAZZLE);

	// dazzle.Tree

	Linker.link(dzl_tree_get_type, "dzl_tree_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_add_builder, "dzl_tree_add_builder", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_expand_to_node, "dzl_tree_expand_to_node", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_find_child_node, "dzl_tree_find_child_node", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_find_custom, "dzl_tree_find_custom", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_find_item, "dzl_tree_find_item", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_get_context_menu, "dzl_tree_get_context_menu", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_get_root, "dzl_tree_get_root", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_get_selected, "dzl_tree_get_selected", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_get_show_icons, "dzl_tree_get_show_icons", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_rebuild, "dzl_tree_rebuild", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_remove_builder, "dzl_tree_remove_builder", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_scroll_to_node, "dzl_tree_scroll_to_node", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_set_context_menu, "dzl_tree_set_context_menu", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_set_filter, "dzl_tree_set_filter", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_set_root, "dzl_tree_set_root", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_set_show_icons, "dzl_tree_set_show_icons", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_unselect_all, "dzl_tree_unselect_all", LIBRARY_DAZZLE);

	// dazzle.TreeBuilder

	Linker.link(dzl_tree_builder_get_type, "dzl_tree_builder_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_builder_new, "dzl_tree_builder_new", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_builder_get_tree, "dzl_tree_builder_get_tree", LIBRARY_DAZZLE);

	// dazzle.TreeNode

	Linker.link(dzl_tree_node_get_type, "dzl_tree_node_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_new, "dzl_tree_node_new", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_add_emblem, "dzl_tree_node_add_emblem", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_append, "dzl_tree_node_append", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_clear_emblems, "dzl_tree_node_clear_emblems", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_collapse, "dzl_tree_node_collapse", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_expand, "dzl_tree_node_expand", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_area, "dzl_tree_node_get_area", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_children_possible, "dzl_tree_node_get_children_possible", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_expanded, "dzl_tree_node_get_expanded", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_foreground_rgba, "dzl_tree_node_get_foreground_rgba", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_gicon, "dzl_tree_node_get_gicon", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_icon_name, "dzl_tree_node_get_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_item, "dzl_tree_node_get_item", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_iter, "dzl_tree_node_get_iter", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_parent, "dzl_tree_node_get_parent", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_path, "dzl_tree_node_get_path", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_reset_on_collapse, "dzl_tree_node_get_reset_on_collapse", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_text, "dzl_tree_node_get_text", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_tree, "dzl_tree_node_get_tree", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_use_dim_label, "dzl_tree_node_get_use_dim_label", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_get_use_markup, "dzl_tree_node_get_use_markup", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_has_emblem, "dzl_tree_node_has_emblem", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_insert, "dzl_tree_node_insert", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_insert_sorted, "dzl_tree_node_insert_sorted", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_invalidate, "dzl_tree_node_invalidate", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_is_root, "dzl_tree_node_is_root", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_n_children, "dzl_tree_node_n_children", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_nth_child, "dzl_tree_node_nth_child", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_prepend, "dzl_tree_node_prepend", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_rebuild, "dzl_tree_node_rebuild", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_remove, "dzl_tree_node_remove", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_remove_emblem, "dzl_tree_node_remove_emblem", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_select, "dzl_tree_node_select", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_children_possible, "dzl_tree_node_set_children_possible", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_emblems, "dzl_tree_node_set_emblems", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_foreground_rgba, "dzl_tree_node_set_foreground_rgba", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_gicon, "dzl_tree_node_set_gicon", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_icon_name, "dzl_tree_node_set_icon_name", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_item, "dzl_tree_node_set_item", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_reset_on_collapse, "dzl_tree_node_set_reset_on_collapse", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_text, "dzl_tree_node_set_text", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_use_dim_label, "dzl_tree_node_set_use_dim_label", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_set_use_markup, "dzl_tree_node_set_use_markup", LIBRARY_DAZZLE);
	Linker.link(dzl_tree_node_show_popover, "dzl_tree_node_show_popover", LIBRARY_DAZZLE);

	// dazzle.Trie

	Linker.link(dzl_trie_get_type, "dzl_trie_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_trie_new, "dzl_trie_new", LIBRARY_DAZZLE);
	Linker.link(dzl_trie_destroy, "dzl_trie_destroy", LIBRARY_DAZZLE);
	Linker.link(dzl_trie_insert, "dzl_trie_insert", LIBRARY_DAZZLE);
	Linker.link(dzl_trie_lookup, "dzl_trie_lookup", LIBRARY_DAZZLE);
	Linker.link(dzl_trie_ref, "dzl_trie_ref", LIBRARY_DAZZLE);
	Linker.link(dzl_trie_remove, "dzl_trie_remove", LIBRARY_DAZZLE);
	Linker.link(dzl_trie_traverse, "dzl_trie_traverse", LIBRARY_DAZZLE);
	Linker.link(dzl_trie_unref, "dzl_trie_unref", LIBRARY_DAZZLE);

	// dazzle.WidgetActionGroup

	Linker.link(dzl_widget_action_group_get_type, "dzl_widget_action_group_get_type", LIBRARY_DAZZLE);
	Linker.link(dzl_widget_action_group_attach, "dzl_widget_action_group_attach", LIBRARY_DAZZLE);
	Linker.link(dzl_widget_action_group_new, "dzl_widget_action_group_new", LIBRARY_DAZZLE);
	Linker.link(dzl_widget_action_group_set_action_enabled, "dzl_widget_action_group_set_action_enabled", LIBRARY_DAZZLE);
}

__gshared extern(C)
{

	// dazzle.Animation

	GType function() c_dzl_animation_get_type;
	uint function(GdkMonitor* monitor, double fromValue, double toValue) c_dzl_animation_calculate_duration;
	void function(DzlAnimation* animation, GParamSpec* pspec, GValue* value) c_dzl_animation_add_property;
	void function(DzlAnimation* animation) c_dzl_animation_start;
	void function(DzlAnimation* animation) c_dzl_animation_stop;

	// dazzle.Application

	GType function() c_dzl_application_get_type;
	DzlApplication* function(const(char)* applicationId, GApplicationFlags flags) c_dzl_application_new;
	void function(DzlApplication* self, const(char)* resourcePath) c_dzl_application_add_resources;
	GMenu* function(DzlApplication* self, const(char)* menuId) c_dzl_application_get_menu_by_id;
	DzlMenuManager* function(DzlApplication* self) c_dzl_application_get_menu_manager;
	DzlShortcutManager* function(DzlApplication* self) c_dzl_application_get_shortcut_manager;
	DzlThemeManager* function(DzlApplication* self) c_dzl_application_get_theme_manager;
	void function(DzlApplication* self, const(char)* resourcePath) c_dzl_application_remove_resources;

	// dazzle.ApplicationWindow

	GType function() c_dzl_application_window_get_type;
	int function(DzlApplicationWindow* self) c_dzl_application_window_get_fullscreen;
	GtkWidget* function(DzlApplicationWindow* self) c_dzl_application_window_get_titlebar;
	void function(DzlApplicationWindow* self, int fullscreen) c_dzl_application_window_set_fullscreen;
	void function(DzlApplicationWindow* self, GtkWidget* titlebar) c_dzl_application_window_set_titlebar;

	// dazzle.Bin

	GType function() c_dzl_bin_get_type;
	GtkWidget* function() c_dzl_bin_new;

	// dazzle.BindingGroup

	GType function() c_dzl_binding_group_get_type;
	DzlBindingGroup* function() c_dzl_binding_group_new;
	void function(DzlBindingGroup* self, const(char)* sourceProperty, void* target, const(char)* targetProperty, GBindingFlags flags) c_dzl_binding_group_bind;
	void function(DzlBindingGroup* self, const(char)* sourceProperty, void* target, const(char)* targetProperty, GBindingFlags flags, GBindingTransformFunc transformTo, GBindingTransformFunc transformFrom, void* userData, GDestroyNotify userDataDestroy) c_dzl_binding_group_bind_full;
	void function(DzlBindingGroup* self, const(char)* sourceProperty, void* target, const(char)* targetProperty, GBindingFlags flags, GClosure* transformTo, GClosure* transformFrom) c_dzl_binding_group_bind_with_closures;
	GObject* function(DzlBindingGroup* self) c_dzl_binding_group_get_source;
	void function(DzlBindingGroup* self, void* source) c_dzl_binding_group_set_source;

	// dazzle.BoldingLabel

	GType function() c_dzl_bolding_label_get_type;
	DzlBoldingLabel* function(const(char)* str, int bold) c_dzl_bolding_label_new;
	DzlBoldingLabel* function(const(char)* str, int bold) c_dzl_bolding_label_new_with_mnemonic;
	void function(DzlBoldingLabel* self, int bold) c_dzl_bolding_label_set_bold;
	void function(DzlBoldingLabel* self, PangoWeight weight) c_dzl_bolding_label_set_weight;

	// dazzle.Box

	GType function() c_dzl_box_get_type;
	GtkWidget* function() c_dzl_box_new;
	int function(DzlBox* self) c_dzl_box_get_max_width_request;
	GtkWidget* function(DzlBox* self, uint nth) c_dzl_box_get_nth_child;
	void function(DzlBox* self, int maxWidthRequest) c_dzl_box_set_max_width_request;

	// dazzle.BoxTheatric

	GType function() c_dzl_box_theatric_get_type;

	// dazzle.CenteringBin

	GType function() c_dzl_centering_bin_get_type;
	GtkWidget* function() c_dzl_centering_bin_new;

	// dazzle.ChildPropertyAction

	GType function() c_dzl_child_property_action_get_type;
	GAction* function(const(char)* name, GtkContainer* container, GtkWidget* child, const(char)* childPropertyName) c_dzl_child_property_action_new;

	// dazzle.ColumnLayout

	GType function() c_dzl_column_layout_get_type;
	GtkWidget* function() c_dzl_column_layout_new;
	int function(DzlColumnLayout* self) c_dzl_column_layout_get_column_spacing;
	int function(DzlColumnLayout* self) c_dzl_column_layout_get_column_width;
	uint function(DzlColumnLayout* self) c_dzl_column_layout_get_max_columns;
	int function(DzlColumnLayout* self) c_dzl_column_layout_get_row_spacing;
	void function(DzlColumnLayout* self, int columnSpacing) c_dzl_column_layout_set_column_spacing;
	void function(DzlColumnLayout* self, int columnWidth) c_dzl_column_layout_set_column_width;
	void function(DzlColumnLayout* self, uint maxColumns) c_dzl_column_layout_set_max_columns;
	void function(DzlColumnLayout* self, int rowSpacing) c_dzl_column_layout_set_row_spacing;

	// dazzle.Counter

	long function(DzlCounter* counter) c_dzl_counter_get;
	void function(DzlCounter* counter) c_dzl_counter_reset;

	// dazzle.CounterArena

	GType function() c_dzl_counter_arena_get_type;
	DzlCounterArena* function(GPid pid) c_dzl_counter_arena_new_for_pid;
	void function(DzlCounterArena* arena, DzlCounterForeachFunc func, void* userData) c_dzl_counter_arena_foreach;
	DzlCounterArena* function(DzlCounterArena* arena) c_dzl_counter_arena_ref;
	void function(DzlCounterArena* arena, DzlCounter* counter) c_dzl_counter_arena_register;
	void function(DzlCounterArena* arena) c_dzl_counter_arena_unref;
	DzlCounterArena* function() c_dzl_counter_arena_get_default;

	// dazzle.CountersWindow

	GType function() c_dzl_counters_window_get_type;
	GtkWidget* function() c_dzl_counters_window_new;
	DzlCounterArena* function(DzlCountersWindow* self) c_dzl_counters_window_get_arena;
	void function(DzlCountersWindow* self, DzlCounterArena* arena) c_dzl_counters_window_set_arena;

	// dazzle.CpuGraph

	GType function() c_dzl_cpu_graph_get_type;
	GtkWidget* function(long timespan, uint maxSamples) c_dzl_cpu_graph_new_full;

	// dazzle.CpuModel

	GType function() c_dzl_cpu_model_get_type;
	DzlGraphModel* function() c_dzl_cpu_model_new;

	// dazzle.CssProvider

	GType function() c_dzl_css_provider_get_type;
	GtkCssProvider* function(const(char)* basePath) c_dzl_css_provider_new;

	// dazzle.DirectoryModel

	GType function() c_dzl_directory_model_get_type;
	GListModel* function(GFile* directory) c_dzl_directory_model_new;
	GFile* function(DzlDirectoryModel* self) c_dzl_directory_model_get_directory;
	void function(DzlDirectoryModel* self, GFile* directory) c_dzl_directory_model_set_directory;
	void function(DzlDirectoryModel* self, DzlDirectoryModelVisibleFunc visibleFunc, void* userData, GDestroyNotify userDataFreeFunc) c_dzl_directory_model_set_visible_func;

	// dazzle.DirectoryReaper

	GType function() c_dzl_directory_reaper_get_type;
	DzlDirectoryReaper* function() c_dzl_directory_reaper_new;
	void function(DzlDirectoryReaper* self, GFile* directory, GTimeSpan minAge) c_dzl_directory_reaper_add_directory;
	void function(DzlDirectoryReaper* self, GFile* file, GTimeSpan minAge) c_dzl_directory_reaper_add_file;
	void function(DzlDirectoryReaper* self, GFile* directory, const(char)* glob, GTimeSpan minAge) c_dzl_directory_reaper_add_glob;
	int function(DzlDirectoryReaper* self, GCancellable* cancellable, GError** err) c_dzl_directory_reaper_execute;
	void function(DzlDirectoryReaper* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_dzl_directory_reaper_execute_async;
	int function(DzlDirectoryReaper* self, GAsyncResult* result, GError** err) c_dzl_directory_reaper_execute_finish;

	// dazzle.Dock

	GType function() c_dzl_dock_get_type;

	// dazzle.DockBin

	GType function() c_dzl_dock_bin_get_type;
	GtkWidget* function() c_dzl_dock_bin_new;
	GtkWidget* function(DzlDockBin* self) c_dzl_dock_bin_get_bottom_edge;
	GtkWidget* function(DzlDockBin* self) c_dzl_dock_bin_get_center_widget;
	GtkWidget* function(DzlDockBin* self) c_dzl_dock_bin_get_left_edge;
	GtkWidget* function(DzlDockBin* self) c_dzl_dock_bin_get_right_edge;
	GtkWidget* function(DzlDockBin* self) c_dzl_dock_bin_get_top_edge;

	// dazzle.DockBinEdge

	GType function() c_dzl_dock_bin_edge_get_type;
	GtkPositionType function(DzlDockBinEdge* self) c_dzl_dock_bin_edge_get_edge;

	// dazzle.DockItem

	GType function() c_dzl_dock_item_get_type;
	int function(DzlDockItem* self, DzlDockItem* child) c_dzl_dock_item_adopt;
	int function(DzlDockItem* self) c_dzl_dock_item_close;
	void function(DzlDockItem* self) c_dzl_dock_item_emit_presented;
	int function(DzlDockItem* self) c_dzl_dock_item_get_can_close;
	int function(DzlDockItem* self) c_dzl_dock_item_get_can_minimize;
	int function(DzlDockItem* self, DzlDockItem* child) c_dzl_dock_item_get_child_visible;
	char* function(DzlDockItem* self) c_dzl_dock_item_get_icon_name;
	DzlDockManager* function(DzlDockItem* self) c_dzl_dock_item_get_manager;
	DzlDockItem* function(DzlDockItem* self) c_dzl_dock_item_get_parent;
	char* function(DzlDockItem* self) c_dzl_dock_item_get_title;
	int function(DzlDockItem* self) c_dzl_dock_item_has_widgets;
	int function(DzlDockItem* self, DzlDockItem* child, GtkPositionType* position) c_dzl_dock_item_minimize;
	void function(DzlDockItem* self) c_dzl_dock_item_needs_attention;
	void function(DzlDockItem* self) c_dzl_dock_item_present;
	void function(DzlDockItem* self, DzlDockItem* child) c_dzl_dock_item_present_child;
	GIcon* function(DzlDockItem* self) c_dzl_dock_item_ref_gicon;
	void function(DzlDockItem* self, DzlDockItem* child) c_dzl_dock_item_release;
	void function(DzlDockItem* self, DzlDockItem* child, int childVisible) c_dzl_dock_item_set_child_visible;
	void function(DzlDockItem* self, DzlDockManager* manager) c_dzl_dock_item_set_manager;
	void function(DzlDockItem* self) c_dzl_dock_item_update_visibility;

	// dazzle.DockManager

	GType function() c_dzl_dock_manager_get_type;
	DzlDockManager* function() c_dzl_dock_manager_new;
	void function(DzlDockManager* self) c_dzl_dock_manager_pause_grabs;
	void function(DzlDockManager* self, DzlDock* dock) c_dzl_dock_manager_register_dock;
	void function(DzlDockManager* self) c_dzl_dock_manager_release_transient_grab;
	void function(DzlDockManager* self) c_dzl_dock_manager_unpause_grabs;
	void function(DzlDockManager* self, DzlDock* dock) c_dzl_dock_manager_unregister_dock;

	// dazzle.DockOverlay

	GType function() c_dzl_dock_overlay_get_type;
	GtkWidget* function() c_dzl_dock_overlay_new;
	DzlDockOverlayEdge* function(DzlDockOverlay* self, GtkPositionType position) c_dzl_dock_overlay_get_edge;
	GtkAdjustment* function(DzlDockOverlay* self, GtkPositionType position) c_dzl_dock_overlay_get_edge_adjustment;

	// dazzle.DockOverlayEdge

	GType function() c_dzl_dock_overlay_edge_get_type;
	GtkPositionType function(DzlDockOverlayEdge* self) c_dzl_dock_overlay_edge_get_edge;
	int function(DzlDockOverlayEdge* self) c_dzl_dock_overlay_edge_get_position;
	void function(DzlDockOverlayEdge* self, GtkPositionType edge) c_dzl_dock_overlay_edge_set_edge;
	void function(DzlDockOverlayEdge* self, int position) c_dzl_dock_overlay_edge_set_position;

	// dazzle.DockPaned

	GType function() c_dzl_dock_paned_get_type;
	GtkWidget* function() c_dzl_dock_paned_new;

	// dazzle.DockRevealer

	GType function() c_dzl_dock_revealer_get_type;
	GtkWidget* function() c_dzl_dock_revealer_new;
	void function(DzlDockRevealer* self, int position, uint transitionDuration) c_dzl_dock_revealer_animate_to_position;
	int function(DzlDockRevealer* self) c_dzl_dock_revealer_get_child_revealed;
	int function(DzlDockRevealer* self) c_dzl_dock_revealer_get_position;
	int function(DzlDockRevealer* self) c_dzl_dock_revealer_get_position_set;
	int function(DzlDockRevealer* self) c_dzl_dock_revealer_get_reveal_child;
	uint function(DzlDockRevealer* self) c_dzl_dock_revealer_get_transition_duration;
	DzlDockRevealerTransitionType function(DzlDockRevealer* self) c_dzl_dock_revealer_get_transition_type;
	int function(DzlDockRevealer* self) c_dzl_dock_revealer_is_animating;
	void function(DzlDockRevealer* self, int position) c_dzl_dock_revealer_set_position;
	void function(DzlDockRevealer* self, int positionSet) c_dzl_dock_revealer_set_position_set;
	void function(DzlDockRevealer* self, int revealChild) c_dzl_dock_revealer_set_reveal_child;
	void function(DzlDockRevealer* self, uint transitionDuration) c_dzl_dock_revealer_set_transition_duration;
	void function(DzlDockRevealer* self, DzlDockRevealerTransitionType transitionType) c_dzl_dock_revealer_set_transition_type;

	// dazzle.DockStack

	GType function() c_dzl_dock_stack_get_type;
	GtkWidget* function() c_dzl_dock_stack_new;
	GtkPositionType function(DzlDockStack* self) c_dzl_dock_stack_get_edge;
	int function(DzlDockStack* self) c_dzl_dock_stack_get_show_pinned_button;
	DzlTabStyle function(DzlDockStack* self) c_dzl_dock_stack_get_style;
	void function(DzlDockStack* self, GtkPositionType edge) c_dzl_dock_stack_set_edge;
	void function(DzlDockStack* self, int showPinnedButton) c_dzl_dock_stack_set_show_pinned_button;
	void function(DzlDockStack* self, DzlTabStyle style) c_dzl_dock_stack_set_style;

	// dazzle.DockTransientGrab

	GType function() c_dzl_dock_transient_grab_get_type;
	DzlDockTransientGrab* function() c_dzl_dock_transient_grab_new;
	void function(DzlDockTransientGrab* self) c_dzl_dock_transient_grab_acquire;
	void function(DzlDockTransientGrab* self, DzlDockItem* item) c_dzl_dock_transient_grab_add_item;
	void function(DzlDockTransientGrab* self) c_dzl_dock_transient_grab_cancel;
	int function(DzlDockTransientGrab* self, DzlDockItem* item) c_dzl_dock_transient_grab_contains;
	uint function(DzlDockTransientGrab* self) c_dzl_dock_transient_grab_get_timeout;
	int function(DzlDockTransientGrab* self, GtkWidget* widget) c_dzl_dock_transient_grab_is_descendant;
	void function(DzlDockTransientGrab* self) c_dzl_dock_transient_grab_release;
	void function(DzlDockTransientGrab* self, DzlDockItem* item) c_dzl_dock_transient_grab_remove_item;
	void function(DzlDockTransientGrab* self, uint timeout) c_dzl_dock_transient_grab_set_timeout;
	void function(DzlDockTransientGrab* self, DzlDockTransientGrab* other) c_dzl_dock_transient_grab_steal_common_ancestors;

	// dazzle.DockWidget

	GType function() c_dzl_dock_widget_get_type;
	GtkWidget* function() c_dzl_dock_widget_new;
	void function(DzlDockWidget* self, GIcon* gicon) c_dzl_dock_widget_set_gicon;
	void function(DzlDockWidget* self, const(char)* iconName) c_dzl_dock_widget_set_icon_name;
	void function(DzlDockWidget* self, const(char)* title) c_dzl_dock_widget_set_title;

	// dazzle.DockWindow

	GType function() c_dzl_dock_window_get_type;
	GtkWidget* function() c_dzl_dock_window_new;

	// dazzle.ElasticBin

	GType function() c_dzl_elastic_bin_get_type;
	GtkWidget* function() c_dzl_elastic_bin_new;

	// dazzle.EmptyState

	GType function() c_dzl_empty_state_get_type;
	GtkWidget* function() c_dzl_empty_state_new;
	const(char)* function(DzlEmptyState* self) c_dzl_empty_state_get_icon_name;
	const(char)* function(DzlEmptyState* self) c_dzl_empty_state_get_subtitle;
	const(char)* function(DzlEmptyState* self) c_dzl_empty_state_get_title;
	void function(DzlEmptyState* self, const(char)* iconName) c_dzl_empty_state_set_icon_name;
	void function(DzlEmptyState* self, const(char)* resource) c_dzl_empty_state_set_resource;
	void function(DzlEmptyState* self, const(char)* title) c_dzl_empty_state_set_subtitle;
	void function(DzlEmptyState* self, const(char)* title) c_dzl_empty_state_set_title;

	// dazzle.EntryBox

	GType function() c_dzl_entry_box_get_type;
	GtkWidget* function() c_dzl_entry_box_new;

	// dazzle.FileChooserEntry

	GType function() c_dzl_file_chooser_entry_get_type;
	GtkWidget* function(const(char)* title, GtkFileChooserAction action) c_dzl_file_chooser_entry_new;
	GtkEntry* function(DzlFileChooserEntry* self) c_dzl_file_chooser_entry_get_entry;
	GFile* function(DzlFileChooserEntry* self) c_dzl_file_chooser_entry_get_file;
	void function(DzlFileChooserEntry* self, GFile* file) c_dzl_file_chooser_entry_set_file;

	// dazzle.FileTransfer

	GType function() c_dzl_file_transfer_get_type;
	DzlFileTransfer* function() c_dzl_file_transfer_new;
	void function(DzlFileTransfer* self, GFile* src, GFile* dest) c_dzl_file_transfer_add;
	int function(DzlFileTransfer* self, int ioPriority, GCancellable* cancellable, GError** err) c_dzl_file_transfer_execute;
	void function(DzlFileTransfer* self, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_dzl_file_transfer_execute_async;
	int function(DzlFileTransfer* self, GAsyncResult* result, GError** err) c_dzl_file_transfer_execute_finish;
	DzlFileTransferFlags function(DzlFileTransfer* self) c_dzl_file_transfer_get_flags;
	double function(DzlFileTransfer* self) c_dzl_file_transfer_get_progress;
	void function(DzlFileTransfer* self, DzlFileTransferFlags flags) c_dzl_file_transfer_set_flags;
	void function(DzlFileTransfer* self, DzlFileTransferStat* statBuf) c_dzl_file_transfer_stat;

	// dazzle.FuzzyIndex

	GType function() c_dzl_fuzzy_index_get_type;
	DzlFuzzyIndex* function() c_dzl_fuzzy_index_new;
	GVariant* function(DzlFuzzyIndex* self, const(char)* key) c_dzl_fuzzy_index_get_metadata;
	const(char)* function(DzlFuzzyIndex* self, const(char)* key) c_dzl_fuzzy_index_get_metadata_string;
	uint function(DzlFuzzyIndex* self, const(char)* key) c_dzl_fuzzy_index_get_metadata_uint32;
	ulong function(DzlFuzzyIndex* self, const(char)* key) c_dzl_fuzzy_index_get_metadata_uint64;
	int function(DzlFuzzyIndex* self, GFile* file, GCancellable* cancellable, GError** err) c_dzl_fuzzy_index_load_file;
	void function(DzlFuzzyIndex* self, GFile* file, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_dzl_fuzzy_index_load_file_async;
	int function(DzlFuzzyIndex* self, GAsyncResult* result, GError** err) c_dzl_fuzzy_index_load_file_finish;
	void function(DzlFuzzyIndex* self, const(char)* query, uint maxMatches, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_dzl_fuzzy_index_query_async;
	GListModel* function(DzlFuzzyIndex* self, GAsyncResult* result, GError** err) c_dzl_fuzzy_index_query_finish;

	// dazzle.FuzzyIndexBuilder

	GType function() c_dzl_fuzzy_index_builder_get_type;
	DzlFuzzyIndexBuilder* function() c_dzl_fuzzy_index_builder_new;
	int function(DzlFuzzyIndexBuilder* self) c_dzl_fuzzy_index_builder_get_case_sensitive;
	GVariant* function(DzlFuzzyIndexBuilder* self, ulong documentId) c_dzl_fuzzy_index_builder_get_document;
	ulong function(DzlFuzzyIndexBuilder* self, const(char)* key, GVariant* document, uint priority) c_dzl_fuzzy_index_builder_insert;
	void function(DzlFuzzyIndexBuilder* self, int caseSensitive) c_dzl_fuzzy_index_builder_set_case_sensitive;
	void function(DzlFuzzyIndexBuilder* self, const(char)* key, GVariant* value) c_dzl_fuzzy_index_builder_set_metadata;
	void function(DzlFuzzyIndexBuilder* self, const(char)* key, const(char)* value) c_dzl_fuzzy_index_builder_set_metadata_string;
	void function(DzlFuzzyIndexBuilder* self, const(char)* key, uint value) c_dzl_fuzzy_index_builder_set_metadata_uint32;
	void function(DzlFuzzyIndexBuilder* self, const(char)* key, ulong value) c_dzl_fuzzy_index_builder_set_metadata_uint64;
	int function(DzlFuzzyIndexBuilder* self, GFile* file, int ioPriority, GCancellable* cancellable, GError** err) c_dzl_fuzzy_index_builder_write;
	void function(DzlFuzzyIndexBuilder* self, GFile* file, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_dzl_fuzzy_index_builder_write_async;
	int function(DzlFuzzyIndexBuilder* self, GAsyncResult* result, GError** err) c_dzl_fuzzy_index_builder_write_finish;

	// dazzle.FuzzyIndexCursor

	GType function() c_dzl_fuzzy_index_cursor_get_type;
	DzlFuzzyIndex* function(DzlFuzzyIndexCursor* self) c_dzl_fuzzy_index_cursor_get_index;

	// dazzle.FuzzyIndexMatch

	GType function() c_dzl_fuzzy_index_match_get_type;
	GVariant* function(DzlFuzzyIndexMatch* self) c_dzl_fuzzy_index_match_get_document;
	const(char)* function(DzlFuzzyIndexMatch* self) c_dzl_fuzzy_index_match_get_key;
	uint function(DzlFuzzyIndexMatch* self) c_dzl_fuzzy_index_match_get_priority;
	float function(DzlFuzzyIndexMatch* self) c_dzl_fuzzy_index_match_get_score;

	// dazzle.FuzzyMutableIndex

	GType function() c_dzl_fuzzy_mutable_index_get_type;
	DzlFuzzyMutableIndex* function(int caseSensitive) c_dzl_fuzzy_mutable_index_new;
	DzlFuzzyMutableIndex* function(int caseSensitive, GDestroyNotify freeFunc) c_dzl_fuzzy_mutable_index_new_with_free_func;
	void function(DzlFuzzyMutableIndex* fuzzy) c_dzl_fuzzy_mutable_index_begin_bulk_insert;
	int function(DzlFuzzyMutableIndex* fuzzy, const(char)* key) c_dzl_fuzzy_mutable_index_contains;
	void function(DzlFuzzyMutableIndex* fuzzy) c_dzl_fuzzy_mutable_index_end_bulk_insert;
	void function(DzlFuzzyMutableIndex* fuzzy, const(char)* key, void* value) c_dzl_fuzzy_mutable_index_insert;
	GArray* function(DzlFuzzyMutableIndex* fuzzy, const(char)* needle, size_t maxMatches) c_dzl_fuzzy_mutable_index_match;
	DzlFuzzyMutableIndex* function(DzlFuzzyMutableIndex* fuzzy) c_dzl_fuzzy_mutable_index_ref;
	void function(DzlFuzzyMutableIndex* fuzzy, const(char)* key) c_dzl_fuzzy_mutable_index_remove;
	void function(DzlFuzzyMutableIndex* fuzzy, GDestroyNotify freeFunc) c_dzl_fuzzy_mutable_index_set_free_func;
	void function(DzlFuzzyMutableIndex* fuzzy) c_dzl_fuzzy_mutable_index_unref;

	// dazzle.GraphColumn

	GType function() c_dzl_graph_view_column_get_type;
	DzlGraphColumn* function(const(char)* name, GType valueType) c_dzl_graph_view_column_new;
	const(char)* function(DzlGraphColumn* self) c_dzl_graph_view_column_get_name;
	void function(DzlGraphColumn* self, const(char)* name) c_dzl_graph_view_column_set_name;

	// dazzle.GraphLineRenderer

	GType function() c_dzl_graph_view_line_renderer_get_type;
	DzlGraphLineRenderer* function() c_dzl_graph_view_line_renderer_new;
	GdkRGBA* function(DzlGraphLineRenderer* self) c_dzl_graph_view_line_renderer_get_stroke_color_rgba;
	void function(DzlGraphLineRenderer* self, const(char)* strokeColor) c_dzl_graph_view_line_renderer_set_stroke_color;
	void function(DzlGraphLineRenderer* self, GdkRGBA* strokeColorRgba) c_dzl_graph_view_line_renderer_set_stroke_color_rgba;

	// dazzle.GraphModel

	GType function() c_dzl_graph_view_model_get_type;
	DzlGraphModel* function() c_dzl_graph_view_model_new;
	void function(DzlGraphModelIter* iter, int firstColumn, ... ) c_dzl_graph_view_model_iter_get;
	long function(DzlGraphModelIter* iter) c_dzl_graph_view_model_iter_get_timestamp;
	void function(DzlGraphModelIter* iter, uint column, GValue* value) c_dzl_graph_view_model_iter_get_value;
	int function(DzlGraphModelIter* iter) c_dzl_graph_view_model_iter_next;
	void function(DzlGraphModelIter* iter, int firstColumn, ... ) c_dzl_graph_view_model_iter_set;
	void function(DzlGraphModelIter* iter, uint column, GValue* value) c_dzl_graph_view_model_iter_set_value;
	uint function(DzlGraphModel* self, DzlGraphColumn* column) c_dzl_graph_view_model_add_column;
	long function(DzlGraphModel* self) c_dzl_graph_view_model_get_end_time;
	int function(DzlGraphModel* self, DzlGraphModelIter* iter) c_dzl_graph_view_model_get_iter_first;
	int function(DzlGraphModel* self, DzlGraphModelIter* iter) c_dzl_graph_view_model_get_iter_last;
	uint function(DzlGraphModel* self) c_dzl_graph_view_model_get_max_samples;
	uint function(DzlGraphModel* self) c_dzl_graph_view_model_get_n_columns;
	GTimeSpan function(DzlGraphModel* self) c_dzl_graph_view_model_get_timespan;
	void function(DzlGraphModel* self, DzlGraphModelIter* iter, long timestamp) c_dzl_graph_view_model_push;
	void function(DzlGraphModel* self, uint nRows) c_dzl_graph_view_model_set_max_samples;
	void function(DzlGraphModel* self, GTimeSpan timespan) c_dzl_graph_view_model_set_timespan;

	// dazzle.GraphRenderer

	GType function() c_dzl_graph_view_renderer_get_type;
	void function(DzlGraphRenderer* self, DzlGraphModel* table, long xBegin, long xEnd, double yBegin, double yEnd, cairo_t* cr, cairo_rectangle_int_t* area) c_dzl_graph_view_renderer_render;

	// dazzle.GraphView

	GType function() c_dzl_graph_view_get_type;
	GtkWidget* function() c_dzl_graph_view_new;
	void function(DzlGraphView* self, DzlGraphRenderer* renderer) c_dzl_graph_view_add_renderer;
	DzlGraphModel* function(DzlGraphView* self) c_dzl_graph_view_get_model;
	void function(DzlGraphView* self, DzlGraphModel* model) c_dzl_graph_view_set_model;

	// dazzle.Heap

	GType function() c_dzl_heap_get_type;
	DzlHeap* function(uint elementSize, GCompareFunc compareFunc) c_dzl_heap_new;
	int function(DzlHeap* heap, void* result) c_dzl_heap_extract;
	int function(DzlHeap* heap, size_t index, void* result) c_dzl_heap_extract_index;
	void function(DzlHeap* heap, void* data, uint len) c_dzl_heap_insert_vals;
	DzlHeap* function(DzlHeap* heap) c_dzl_heap_ref;
	void function(DzlHeap* heap) c_dzl_heap_unref;

	// dazzle.JoinedMenu

	GType function() c_dzl_joined_menu_get_type;
	DzlJoinedMenu* function() c_dzl_joined_menu_new;
	void function(DzlJoinedMenu* self, GMenuModel* model) c_dzl_joined_menu_append_menu;
	uint function(DzlJoinedMenu* self) c_dzl_joined_menu_get_n_joined;
	void function(DzlJoinedMenu* self, GMenuModel* model) c_dzl_joined_menu_prepend_menu;
	void function(DzlJoinedMenu* self, uint index) c_dzl_joined_menu_remove_index;
	void function(DzlJoinedMenu* self, GMenuModel* model) c_dzl_joined_menu_remove_menu;

	// dazzle.ListBox

	GType function() c_dzl_list_box_get_type;
	GtkWidget* function(GType rowType, const(char)* propertyName) c_dzl_list_box_new;
	GListModel* function(DzlListBox* self) c_dzl_list_box_get_model;
	const(char)* function(DzlListBox* self) c_dzl_list_box_get_property_name;
	GType function(DzlListBox* self) c_dzl_list_box_get_row_type;
	void function(DzlListBox* self, GListModel* model) c_dzl_list_box_set_model;
	void function(DzlListBox* self, uint recycleMax) c_dzl_list_box_set_recycle_max;

	// dazzle.ListBoxRow

	GType function() c_dzl_list_box_row_get_type;

	// dazzle.ListModelFilter

	GType function() c_dzl_list_model_filter_get_type;
	DzlListModelFilter* function(GListModel* childModel) c_dzl_list_model_filter_new;
	GListModel* function(DzlListModelFilter* self) c_dzl_list_model_filter_get_child_model;
	void function(DzlListModelFilter* self) c_dzl_list_model_filter_invalidate;
	void function(DzlListModelFilter* self, DzlListModelFilterFunc filterFunc, void* filterFuncData, GDestroyNotify filterFuncDataDestroy) c_dzl_list_model_filter_set_filter_func;

	// dazzle.ListStoreAdapter

	GType function() c_dzl_list_store_adapter_get_type;
	DzlListStoreAdapter* function(GListModel* model) c_dzl_list_store_adapter_new;
	GListModel* function(DzlListStoreAdapter* self) c_dzl_list_store_adapter_get_model;
	void function(DzlListStoreAdapter* self, GListModel* model) c_dzl_list_store_adapter_set_model;

	// dazzle.MenuButton

	GType function() c_dzl_menu_button_get_type;
	GtkWidget* function(const(char)* iconName, GMenuModel* model) c_dzl_menu_button_new_with_model;
	GMenuModel* function(DzlMenuButton* self) c_dzl_menu_button_get_model;
	int function(DzlMenuButton* self) c_dzl_menu_button_get_show_accels;
	int function(DzlMenuButton* self) c_dzl_menu_button_get_show_arrow;
	int function(DzlMenuButton* self) c_dzl_menu_button_get_show_icons;
	void function(DzlMenuButton* self, GMenuModel* model) c_dzl_menu_button_set_model;
	void function(DzlMenuButton* self, int showAccels) c_dzl_menu_button_set_show_accels;
	void function(DzlMenuButton* self, int showArrow) c_dzl_menu_button_set_show_arrow;
	void function(DzlMenuButton* self, int showIcons) c_dzl_menu_button_set_show_icons;

	// dazzle.MenuManager

	GType function() c_dzl_menu_manager_get_type;
	DzlMenuManager* function() c_dzl_menu_manager_new;
	uint function(DzlMenuManager* self, const(char)* filename, GError** err) c_dzl_menu_manager_add_filename;
	uint function(DzlMenuManager* self, const(char)* resource, GError** err) c_dzl_menu_manager_add_resource;
	GMenu* function(DzlMenuManager* self, const(char)* menuId) c_dzl_menu_manager_get_menu_by_id;
	uint function(DzlMenuManager* self, const(char)* menuId, GMenuModel* model) c_dzl_menu_manager_merge;
	void function(DzlMenuManager* self, uint mergeId) c_dzl_menu_manager_remove;

	// dazzle.MultiPaned

	GType function() c_dzl_multi_paned_get_type;
	GtkWidget* function() c_dzl_multi_paned_new;
	GtkWidget* function(DzlMultiPaned* self, int x, int y) c_dzl_multi_paned_get_at_point;
	uint function(DzlMultiPaned* self) c_dzl_multi_paned_get_n_children;
	GtkWidget* function(DzlMultiPaned* self, uint nth) c_dzl_multi_paned_get_nth_child;

	// dazzle.Path

	GType function() c_dzl_path_get_type;
	DzlPath* function() c_dzl_path_new;
	void function(DzlPath* self, DzlPathElement* element) c_dzl_path_append;
	DzlPathElement* function(DzlPath* self, uint index) c_dzl_path_get_element;
	GList* function(DzlPath* self) c_dzl_path_get_elements;
	uint function(DzlPath* self) c_dzl_path_get_length;
	int function(DzlPath* self, DzlPath* prefix) c_dzl_path_has_prefix;
	int function(DzlPath* self) c_dzl_path_is_empty;
	void function(DzlPath* self, DzlPathElement* element) c_dzl_path_prepend;
	char* function(DzlPath* self) c_dzl_path_printf;

	// dazzle.PathBar

	GType function() c_dzl_path_bar_get_type;
	GtkWidget* function() c_dzl_path_bar_new;
	DzlPath* function(DzlPathBar* self) c_dzl_path_bar_get_path;
	void function(DzlPathBar* self, DzlPath* path) c_dzl_path_bar_set_path;
	void function(DzlPathBar* self, uint index) c_dzl_path_bar_set_selected_index;

	// dazzle.PathElement

	GType function() c_dzl_path_element_get_type;
	DzlPathElement* function(const(char)* id, const(char)* iconName, const(char)* title) c_dzl_path_element_new;
	const(char)* function(DzlPathElement* self) c_dzl_path_element_get_icon_name;
	const(char)* function(DzlPathElement* self) c_dzl_path_element_get_id;
	const(char)* function(DzlPathElement* self) c_dzl_path_element_get_title;

	// dazzle.PatternSpec

	GType function() c_dzl_pattern_spec_get_type;
	DzlPatternSpec* function(const(char)* keywords) c_dzl_pattern_spec_new;
	const(char)* function(DzlPatternSpec* self) c_dzl_pattern_spec_get_text;
	int function(DzlPatternSpec* self, const(char)* haystack) c_dzl_pattern_spec_match;
	DzlPatternSpec* function(DzlPatternSpec* self) c_dzl_pattern_spec_ref;
	void function(DzlPatternSpec* self) c_dzl_pattern_spec_unref;

	// dazzle.PillBox

	GType function() c_dzl_pill_box_get_type;
	GtkWidget* function(const(char)* label) c_dzl_pill_box_new;
	const(char)* function(DzlPillBox* self) c_dzl_pill_box_get_label;
	void function(DzlPillBox* self, const(char)* label) c_dzl_pill_box_set_label;

	// dazzle.Preferences

	GType function() c_dzl_preferences_get_type;
	uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, GtkWidget* widget, const(char)* keywords, int priority) c_dzl_preferences_add_custom;
	uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* path, const(char)* title, const(char)* subtitle, GtkFileChooserAction action, const(char)* keywords, int priority) c_dzl_preferences_add_file_chooser;
	uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* title, const(char)* keywords, int priority) c_dzl_preferences_add_font_button;
	void function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* title, int priority) c_dzl_preferences_add_group;
	void function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* title, GtkSelectionMode mode, int priority) c_dzl_preferences_add_list_group;
	void function(DzlPreferences* self, const(char)* pageName, const(char)* title, int priority) c_dzl_preferences_add_page;
	uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* path, const(char)* variantString, const(char)* title, const(char)* subtitle, const(char)* keywords, int priority) c_dzl_preferences_add_radio;
	uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* path, const(char)* title, const(char)* subtitle, const(char)* keywords, int priority) c_dzl_preferences_add_spin_button;
	uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, const(char)* schemaId, const(char)* key, const(char)* path, const(char)* variantString, const(char)* title, const(char)* subtitle, const(char)* keywords, int priority) c_dzl_preferences_add_switch;
	uint function(DzlPreferences* self, const(char)* pageName, const(char)* groupName, GtkWidget* firstWidget, ... ) c_dzl_preferences_add_table_row;
	GtkWidget* function(DzlPreferences* self, uint widgetId) c_dzl_preferences_get_widget;
	int function(DzlPreferences* self, uint widgetId) c_dzl_preferences_remove_id;
	void function(DzlPreferences* self, const(char)* pageName, GHashTable* map) c_dzl_preferences_set_page;

	// dazzle.PreferencesBin

	GType function() c_dzl_preferences_bin_get_type;

	// dazzle.PreferencesEntry

	GType function() c_dzl_preferences_entry_get_type;
	GtkWidget* function(DzlPreferencesEntry* self) c_dzl_preferences_entry_get_entry_widget;
	GtkWidget* function(DzlPreferencesEntry* self) c_dzl_preferences_entry_get_title_widget;

	// dazzle.PreferencesFileChooserButton

	GType function() c_dzl_preferences_file_chooser_button_get_type;

	// dazzle.PreferencesFlowBox

	GType function() c_dzl_preferences_flow_box_get_type;
	GtkWidget* function() c_dzl_preferences_flow_box_new;

	// dazzle.PreferencesFontButton

	GType function() c_dzl_preferences_font_button_get_type;

	// dazzle.PreferencesGroup

	GType function() c_dzl_preferences_group_get_type;
	void function(DzlPreferencesGroup* self, GtkWidget* widget) c_dzl_preferences_group_add;
	int function(DzlPreferencesGroup* self) c_dzl_preferences_group_get_priority;
	GtkSizeGroup* function(DzlPreferencesGroup* self, uint column) c_dzl_preferences_group_get_size_group;
	const(char)* function(DzlPreferencesGroup* self) c_dzl_preferences_group_get_title;
	uint function(DzlPreferencesGroup* self, DzlPatternSpec* spec) c_dzl_preferences_group_refilter;
	void function(DzlPreferencesGroup* self, GHashTable* map) c_dzl_preferences_group_set_map;

	// dazzle.PreferencesPage

	GType function() c_dzl_preferences_page_get_type;
	void function(DzlPreferencesPage* self, DzlPreferencesGroup* group) c_dzl_preferences_page_add_group;
	DzlPreferencesGroup* function(DzlPreferencesPage* self, const(char)* groupName) c_dzl_preferences_page_get_group;
	void function(DzlPreferencesPage* self, DzlPatternSpec* spec) c_dzl_preferences_page_refilter;
	void function(DzlPreferencesPage* self, GHashTable* map) c_dzl_preferences_page_set_map;

	// dazzle.PreferencesSpinButton

	GType function() c_dzl_preferences_spin_button_get_type;
	GtkWidget* function(DzlPreferencesSpinButton* self) c_dzl_preferences_spin_button_get_spin_button;

	// dazzle.PreferencesSwitch

	GType function() c_dzl_preferences_switch_get_type;

	// dazzle.PreferencesView

	GType function() c_dzl_preferences_view_get_type;
	GtkWidget* function() c_dzl_preferences_view_new;
	int function(DzlPreferencesView* self) c_dzl_preferences_view_get_show_search_entry;
	int function(DzlPreferencesView* self) c_dzl_preferences_view_get_use_sidebar;
	void function(DzlPreferencesView* self) c_dzl_preferences_view_reapply_filter;
	void function(DzlPreferencesView* self, int showSearchEntry) c_dzl_preferences_view_set_show_search_entry;
	void function(DzlPreferencesView* self, int useSidebar) c_dzl_preferences_view_set_use_sidebar;

	// dazzle.PriorityBox

	GType function() c_dzl_priority_box_get_type;
	GtkWidget* function() c_dzl_priority_box_new;

	// dazzle.ProgressButton

	GType function() c_dzl_progress_button_get_type;
	GtkWidget* function() c_dzl_progress_button_new;
	uint function(DzlProgressButton* self) c_dzl_progress_button_get_progress;
	int function(DzlProgressButton* self) c_dzl_progress_button_get_show_progress;
	void function(DzlProgressButton* button, uint percentage) c_dzl_progress_button_set_progress;
	void function(DzlProgressButton* button, int showProgress) c_dzl_progress_button_set_show_progress;

	// dazzle.ProgressIcon

	GType function() c_dzl_progress_icon_get_type;
	GtkWidget* function() c_dzl_progress_icon_new;
	double function(DzlProgressIcon* self) c_dzl_progress_icon_get_progress;
	void function(DzlProgressIcon* self, double progress) c_dzl_progress_icon_set_progress;

	// dazzle.ProgressMenuButton

	GType function() c_dzl_progress_menu_button_get_type;
	GtkWidget* function() c_dzl_progress_menu_button_new;
	double function(DzlProgressMenuButton* button) c_dzl_progress_menu_button_get_progress;
	int function(DzlProgressMenuButton* self) c_dzl_progress_menu_button_get_show_progress;
	int function(DzlProgressMenuButton* self) c_dzl_progress_menu_button_get_show_theatric;
	void function(DzlProgressMenuButton* self) c_dzl_progress_menu_button_reset_theatrics;
	void function(DzlProgressMenuButton* button, double progress) c_dzl_progress_menu_button_set_progress;
	void function(DzlProgressMenuButton* self, int showProgress) c_dzl_progress_menu_button_set_show_progress;
	void function(DzlProgressMenuButton* self, int showTheatic) c_dzl_progress_menu_button_set_show_theatric;

	// dazzle.PropertiesGroup

	GType function() c_dzl_properties_group_get_type;
	DzlPropertiesGroup* function(GObject* object) c_dzl_properties_group_new;
	DzlPropertiesGroup* function(GType objectType) c_dzl_properties_group_new_for_type;
	void function(DzlPropertiesGroup* self) c_dzl_properties_group_add_all_properties;
	void function(DzlPropertiesGroup* self, const(char)* name, const(char)* propertyName) c_dzl_properties_group_add_property;
	void function(DzlPropertiesGroup* self, const(char)* name, const(char)* propertyName, DzlPropertiesFlags flags) c_dzl_properties_group_add_property_full;
	void function(DzlPropertiesGroup* self, const(char)* name) c_dzl_properties_group_remove;

	// dazzle.RadioBox

	GType function() c_dzl_radio_box_get_type;
	GtkWidget* function() c_dzl_radio_box_new;
	void function(DzlRadioBox* self, const(char)* id, const(char)* text) c_dzl_radio_box_add_item;
	const(char)* function(DzlRadioBox* self) c_dzl_radio_box_get_active_id;
	void function(DzlRadioBox* self, const(char)* id) c_dzl_radio_box_remove_item;
	void function(DzlRadioBox* self, const(char)* id) c_dzl_radio_box_set_active_id;

	// dazzle.ReadOnlyListModel

	GType function() c_dzl_read_only_list_model_get_type;
	GListModel* function(GListModel* baseModel) c_dzl_read_only_list_model_new;

	// dazzle.RecursiveFileMonitor

	GType function() c_dzl_recursive_file_monitor_get_type;
	DzlRecursiveFileMonitor* function(GFile* root) c_dzl_recursive_file_monitor_new;
	void function(DzlRecursiveFileMonitor* self) c_dzl_recursive_file_monitor_cancel;
	GFile* function(DzlRecursiveFileMonitor* self) c_dzl_recursive_file_monitor_get_root;
	void function(DzlRecursiveFileMonitor* self, DzlRecursiveIgnoreFunc ignoreFunc, void* ignoreFuncData, GDestroyNotify ignoreFuncDataDestroy) c_dzl_recursive_file_monitor_set_ignore_func;
	void function(DzlRecursiveFileMonitor* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_dzl_recursive_file_monitor_start_async;
	int function(DzlRecursiveFileMonitor* self, GAsyncResult* result, GError** err) c_dzl_recursive_file_monitor_start_finish;

	// dazzle.Ring

	GType function() c_dzl_ring_get_type;
	DzlRing* function(uint elementSize, uint reservedSize, GDestroyNotify elementDestroy) c_dzl_ring_sized_new;
	uint function(DzlRing* ring, void* data, uint len) c_dzl_ring_append_vals;
	void function(DzlRing* ring, GFunc func, void* userData) c_dzl_ring_foreach;
	DzlRing* function(DzlRing* ring) c_dzl_ring_ref;
	void function(DzlRing* ring) c_dzl_ring_unref;

	// dazzle.ScrolledWindow

	GType function() c_dzl_scrolled_window_get_type;

	// dazzle.SearchBar

	GType function() c_dzl_search_bar_get_type;
	GtkWidget* function() c_dzl_search_bar_new;
	GtkWidget* function(DzlSearchBar* self) c_dzl_search_bar_get_entry;
	int function(DzlSearchBar* self) c_dzl_search_bar_get_search_mode_enabled;
	int function(DzlSearchBar* self) c_dzl_search_bar_get_show_close_button;
	void function(DzlSearchBar* self, int searchModeEnabled) c_dzl_search_bar_set_search_mode_enabled;
	void function(DzlSearchBar* self, int showCloseButton) c_dzl_search_bar_set_show_close_button;

	// dazzle.SettingsFlagAction

	GType function() c_dzl_settings_flag_action_get_type;
	GAction* function(const(char)* schemaId, const(char)* schemaKey, const(char)* flagNick) c_dzl_settings_flag_action_new;

	// dazzle.SettingsSandwich

	GType function() c_dzl_settings_sandwich_get_type;
	DzlSettingsSandwich* function(const(char)* schemaId, const(char)* path) c_dzl_settings_sandwich_new;
	void function(DzlSettingsSandwich* self, GSettings* settings) c_dzl_settings_sandwich_append;
	void function(DzlSettingsSandwich* self, const(char)* key, void* object, const(char)* property, GSettingsBindFlags flags) c_dzl_settings_sandwich_bind;
	void function(DzlSettingsSandwich* self, const(char)* key, void* object, const(char)* property, GSettingsBindFlags flags, GSettingsBindGetMapping getMapping, GSettingsBindSetMapping setMapping, void* userData, GDestroyNotify destroy) c_dzl_settings_sandwich_bind_with_mapping;
	int function(DzlSettingsSandwich* self, const(char)* key) c_dzl_settings_sandwich_get_boolean;
	GVariant* function(DzlSettingsSandwich* self, const(char)* key) c_dzl_settings_sandwich_get_default_value;
	double function(DzlSettingsSandwich* self, const(char)* key) c_dzl_settings_sandwich_get_double;
	int function(DzlSettingsSandwich* self, const(char)* key) c_dzl_settings_sandwich_get_int;
	char* function(DzlSettingsSandwich* self, const(char)* key) c_dzl_settings_sandwich_get_string;
	uint function(DzlSettingsSandwich* self, const(char)* key) c_dzl_settings_sandwich_get_uint;
	GVariant* function(DzlSettingsSandwich* self, const(char)* key) c_dzl_settings_sandwich_get_user_value;
	GVariant* function(DzlSettingsSandwich* self, const(char)* key) c_dzl_settings_sandwich_get_value;
	void function(DzlSettingsSandwich* self, const(char)* key, int val) c_dzl_settings_sandwich_set_boolean;
	void function(DzlSettingsSandwich* self, const(char)* key, double val) c_dzl_settings_sandwich_set_double;
	void function(DzlSettingsSandwich* self, const(char)* key, int val) c_dzl_settings_sandwich_set_int;
	void function(DzlSettingsSandwich* self, const(char)* key, const(char)* val) c_dzl_settings_sandwich_set_string;
	void function(DzlSettingsSandwich* self, const(char)* key, uint val) c_dzl_settings_sandwich_set_uint;
	void function(DzlSettingsSandwich* self, const(char)* key, GVariant* value) c_dzl_settings_sandwich_set_value;
	void function(DzlSettingsSandwich* self, const(char)* property) c_dzl_settings_sandwich_unbind;

	// dazzle.ShortcutAccelDialog

	GType function() c_dzl_shortcut_accel_dialog_get_type;
	GtkWidget* function() c_dzl_shortcut_accel_dialog_new;
	char* function(DzlShortcutAccelDialog* self) c_dzl_shortcut_accel_dialog_get_accelerator;
	DzlShortcutChord* function(DzlShortcutAccelDialog* self) c_dzl_shortcut_accel_dialog_get_chord;
	const(char)* function(DzlShortcutAccelDialog* self) c_dzl_shortcut_accel_dialog_get_shortcut_title;
	void function(DzlShortcutAccelDialog* self, const(char)* accelerator) c_dzl_shortcut_accel_dialog_set_accelerator;
	void function(DzlShortcutAccelDialog* self, const(char)* title) c_dzl_shortcut_accel_dialog_set_shortcut_title;

	// dazzle.ShortcutChord

	GType function() c_dzl_shortcut_chord_get_type;
	DzlShortcutChord* function(GdkEventKey* event) c_dzl_shortcut_chord_new_from_event;
	DzlShortcutChord* function(const(char)* accelerator) c_dzl_shortcut_chord_new_from_string;
	int function(DzlShortcutChord* self, GdkEventKey* event) c_dzl_shortcut_chord_append_event;
	DzlShortcutChord* function(DzlShortcutChord* self) c_dzl_shortcut_chord_copy;
	void function(DzlShortcutChord* self) c_dzl_shortcut_chord_free;
	char* function(DzlShortcutChord* self) c_dzl_shortcut_chord_get_label;
	uint function(DzlShortcutChord* self) c_dzl_shortcut_chord_get_length;
	void function(DzlShortcutChord* self, uint nth, uint* keyval, GdkModifierType* modifier) c_dzl_shortcut_chord_get_nth_key;
	int function(DzlShortcutChord* self) c_dzl_shortcut_chord_has_modifier;
	DzlShortcutMatch function(DzlShortcutChord* self, DzlShortcutChord* other) c_dzl_shortcut_chord_match;
	char* function(DzlShortcutChord* self) c_dzl_shortcut_chord_to_string;
	int function(void* data1, void* data2) c_dzl_shortcut_chord_equal;
	uint function(void* data) c_dzl_shortcut_chord_hash;

	// dazzle.ShortcutChordTable

	void function(DzlShortcutChordTable* self, DzlShortcutChord* chord, void* data) c_dzl_shortcut_chord_table_add;
	void function(DzlShortcutChordTable* self, DzlShortcutChordTableForeach foreachFunc, void* foreachData) c_dzl_shortcut_chord_table_foreach;
	void function(DzlShortcutChordTable* self) c_dzl_shortcut_chord_table_free;
	DzlShortcutMatch function(DzlShortcutChordTable* self, DzlShortcutChord* chord, void** data) c_dzl_shortcut_chord_table_lookup;
	DzlShortcutChord* function(DzlShortcutChordTable* self, void* data) c_dzl_shortcut_chord_table_lookup_data;
	void function(DzlShortcutChordTable* self) c_dzl_shortcut_chord_table_printf;
	int function(DzlShortcutChordTable* self, DzlShortcutChord* chord) c_dzl_shortcut_chord_table_remove;
	int function(DzlShortcutChordTable* self, void* data) c_dzl_shortcut_chord_table_remove_data;
	void function(DzlShortcutChordTable* self, GDestroyNotify notify) c_dzl_shortcut_chord_table_set_free_func;
	uint function(DzlShortcutChordTable* self) c_dzl_shortcut_chord_table_size;
	DzlShortcutChordTable* function() c_dzl_shortcut_chord_table_new;

	// dazzle.ShortcutContext

	GType function() c_dzl_shortcut_context_get_type;
	DzlShortcutContext* function(const(char)* name) c_dzl_shortcut_context_new;
	DzlShortcutMatch function(DzlShortcutContext* self, GtkWidget* widget, DzlShortcutChord* chord) c_dzl_shortcut_context_activate;
	void function(DzlShortcutContext* self, const(char)* accel, const(char)* detailedActionName) c_dzl_shortcut_context_add_action;
	void function(DzlShortcutContext* self, const(char)* accel, const(char)* command) c_dzl_shortcut_context_add_command;
	void function(DzlShortcutContext* self, const(char)* accel, const(char)* signalName, uint nArgs, ... ) c_dzl_shortcut_context_add_signal;
	void function(DzlShortcutContext* self, const(char)* accel, const(char)* signalName, uint nArgs, void* args) c_dzl_shortcut_context_add_signal_va_list;
	void function(DzlShortcutContext* self, const(char)* accel, const(char)* signalName, GArray* values) c_dzl_shortcut_context_add_signalv;
	const(char)* function(DzlShortcutContext* self) c_dzl_shortcut_context_get_name;
	int function(DzlShortcutContext* self, const(char)* data, ptrdiff_t len, GError** err) c_dzl_shortcut_context_load_from_data;
	int function(DzlShortcutContext* self, const(char)* resourcePath, GError** err) c_dzl_shortcut_context_load_from_resource;
	int function(DzlShortcutContext* self, const(char)* accel) c_dzl_shortcut_context_remove;

	// dazzle.ShortcutController

	GType function() c_dzl_shortcut_controller_get_type;
	DzlShortcutController* function(GtkWidget* widget) c_dzl_shortcut_controller_new;
	DzlShortcutController* function(GtkWidget* widget) c_dzl_shortcut_controller_find;
	DzlShortcutController* function(GtkWidget* widget) c_dzl_shortcut_controller_try_find;
	void function(DzlShortcutController* self, const(char)* commandId, const(char)* defaultAccel, DzlShortcutPhase phase, const(char)* action) c_dzl_shortcut_controller_add_command_action;
	void function(DzlShortcutController* self, const(char)* commandId, const(char)* defaultAccel, DzlShortcutPhase phase, GtkCallback callback, void* callbackData, GDestroyNotify callbackDataDestroy) c_dzl_shortcut_controller_add_command_callback;
	void function(DzlShortcutController* self, const(char)* commandId, const(char)* defaultAccel, DzlShortcutPhase phase, const(char)* signalName, uint nArgs, ... ) c_dzl_shortcut_controller_add_command_signal;
	int function(DzlShortcutController* self, const(char)* command) c_dzl_shortcut_controller_execute_command;
	DzlShortcutContext* function(DzlShortcutController* self) c_dzl_shortcut_controller_get_context;
	DzlShortcutContext* function(DzlShortcutController* self, DzlShortcutPhase phase) c_dzl_shortcut_controller_get_context_for_phase;
	DzlShortcutChord* function(DzlShortcutController* self) c_dzl_shortcut_controller_get_current_chord;
	DzlShortcutManager* function(DzlShortcutController* self) c_dzl_shortcut_controller_get_manager;
	GtkWidget* function(DzlShortcutController* self) c_dzl_shortcut_controller_get_widget;
	void function(DzlShortcutController* self, const(char)* accel, DzlShortcutPhase phase) c_dzl_shortcut_controller_remove_accel;
	void function(DzlShortcutController* self, const(char)* name) c_dzl_shortcut_controller_set_context_by_name;
	void function(DzlShortcutController* self, DzlShortcutManager* manager) c_dzl_shortcut_controller_set_manager;

	// dazzle.ShortcutLabel

	GType function() c_dzl_shortcut_label_get_type;
	GtkWidget* function() c_dzl_shortcut_label_new;
	char* function(DzlShortcutLabel* self) c_dzl_shortcut_label_get_accelerator;
	DzlShortcutChord* function(DzlShortcutLabel* self) c_dzl_shortcut_label_get_chord;
	void function(DzlShortcutLabel* self, const(char)* accelerator) c_dzl_shortcut_label_set_accelerator;
	void function(DzlShortcutLabel* self, DzlShortcutChord* chord) c_dzl_shortcut_label_set_chord;

	// dazzle.ShortcutManager

	GType function() c_dzl_shortcut_manager_get_type;
	DzlShortcutManager* function() c_dzl_shortcut_manager_get_default;
	void function(DzlShortcutManager* self, const(char)* detailedActionName, const(char)* section, const(char)* group, const(char)* title, const(char)* subtitle) c_dzl_shortcut_manager_add_action;
	void function(DzlShortcutManager* self, const(char)* command, const(char)* section, const(char)* group, const(char)* title, const(char)* subtitle) c_dzl_shortcut_manager_add_command;
	void function(DzlShortcutManager* self, DzlShortcutEntry* shortcuts, uint nShortcuts, const(char)* translationDomain) c_dzl_shortcut_manager_add_shortcut_entries;
	void function(DzlShortcutManager* self, DzlShortcutsWindow* window) c_dzl_shortcut_manager_add_shortcuts_to_window;
	void function(DzlShortcutManager* self, const(char)* directory) c_dzl_shortcut_manager_append_search_path;
	DzlShortcutTheme* function(DzlShortcutManager* self) c_dzl_shortcut_manager_get_theme;
	DzlShortcutTheme* function(DzlShortcutManager* self, const(char)* themeName) c_dzl_shortcut_manager_get_theme_by_name;
	const(char)* function(DzlShortcutManager* self) c_dzl_shortcut_manager_get_theme_name;
	const(char)* function(DzlShortcutManager* self) c_dzl_shortcut_manager_get_user_dir;
	int function(DzlShortcutManager* self, GdkEventKey* event, GtkWidget* toplevel) c_dzl_shortcut_manager_handle_event;
	void function(DzlShortcutManager* self, const(char)* directory) c_dzl_shortcut_manager_prepend_search_path;
	void function(DzlShortcutManager* self) c_dzl_shortcut_manager_queue_reload;
	void function(DzlShortcutManager* self, GCancellable* cancellable) c_dzl_shortcut_manager_reload;
	void function(DzlShortcutManager* self, const(char)* directory) c_dzl_shortcut_manager_remove_search_path;
	void function(DzlShortcutManager* self, DzlShortcutTheme* theme) c_dzl_shortcut_manager_set_theme;
	void function(DzlShortcutManager* self, const(char)* themeName) c_dzl_shortcut_manager_set_theme_name;
	void function(DzlShortcutManager* self, const(char)* userDir) c_dzl_shortcut_manager_set_user_dir;

	// dazzle.ShortcutModel

	GType function() c_dzl_shortcut_model_get_type;
	GtkTreeModel* function() c_dzl_shortcut_model_new;
	DzlShortcutManager* function(DzlShortcutModel* self) c_dzl_shortcut_model_get_manager;
	DzlShortcutTheme* function(DzlShortcutModel* self) c_dzl_shortcut_model_get_theme;
	void function(DzlShortcutModel* self) c_dzl_shortcut_model_rebuild;
	void function(DzlShortcutModel* self, GtkTreeIter* iter, DzlShortcutChord* chord) c_dzl_shortcut_model_set_chord;
	void function(DzlShortcutModel* self, DzlShortcutManager* manager) c_dzl_shortcut_model_set_manager;
	void function(DzlShortcutModel* self, DzlShortcutTheme* theme) c_dzl_shortcut_model_set_theme;

	// dazzle.ShortcutSimpleLabel

	GType function() c_dzl_shortcut_simple_label_get_type;
	GtkWidget* function() c_dzl_shortcut_simple_label_new;
	const(char)* function(DzlShortcutSimpleLabel* self) c_dzl_shortcut_simple_label_get_accel;
	const(char)* function(DzlShortcutSimpleLabel* self) c_dzl_shortcut_simple_label_get_action;
	const(char)* function(DzlShortcutSimpleLabel* self) c_dzl_shortcut_simple_label_get_command;
	const(char)* function(DzlShortcutSimpleLabel* self) c_dzl_shortcut_simple_label_get_title;
	void function(DzlShortcutSimpleLabel* self, const(char)* accel) c_dzl_shortcut_simple_label_set_accel;
	void function(DzlShortcutSimpleLabel* self, const(char)* action) c_dzl_shortcut_simple_label_set_action;
	void function(DzlShortcutSimpleLabel* self, const(char)* command) c_dzl_shortcut_simple_label_set_command;
	void function(DzlShortcutSimpleLabel* self, const(char)* title) c_dzl_shortcut_simple_label_set_title;

	// dazzle.ShortcutTheme

	GType function() c_dzl_shortcut_theme_get_type;
	DzlShortcutTheme* function(const(char)* name) c_dzl_shortcut_theme_new;
	void function(DzlShortcutTheme* self, const(char)* accelerator, const(char)* command) c_dzl_shortcut_theme_add_command;
	void function(DzlShortcutTheme* self, DzlShortcutContext* context) c_dzl_shortcut_theme_add_context;
	void function(DzlShortcutTheme* self, const(char)* path) c_dzl_shortcut_theme_add_css_resource;
	DzlShortcutContext* function(DzlShortcutTheme* self, const(char)* name) c_dzl_shortcut_theme_find_context_by_name;
	DzlShortcutContext* function(DzlShortcutTheme* self, GtkWidget* widget) c_dzl_shortcut_theme_find_default_context;
	DzlShortcutChord* function(DzlShortcutTheme* self, const(char)* detailedActionName) c_dzl_shortcut_theme_get_chord_for_action;
	DzlShortcutChord* function(DzlShortcutTheme* self, const(char)* command) c_dzl_shortcut_theme_get_chord_for_command;
	const(char)* function(DzlShortcutTheme* self) c_dzl_shortcut_theme_get_name;
	DzlShortcutTheme* function(DzlShortcutTheme* self) c_dzl_shortcut_theme_get_parent;
	const(char)* function(DzlShortcutTheme* self) c_dzl_shortcut_theme_get_parent_name;
	const(char)* function(DzlShortcutTheme* self) c_dzl_shortcut_theme_get_subtitle;
	const(char)* function(DzlShortcutTheme* self) c_dzl_shortcut_theme_get_title;
	int function(DzlShortcutTheme* self, const(char)* data, ptrdiff_t len, GError** err) c_dzl_shortcut_theme_load_from_data;
	int function(DzlShortcutTheme* self, GFile* file, GCancellable* cancellable, GError** err) c_dzl_shortcut_theme_load_from_file;
	int function(DzlShortcutTheme* self, const(char)* path, GCancellable* cancellable, GError** err) c_dzl_shortcut_theme_load_from_path;
	void function(DzlShortcutTheme* self, const(char)* path) c_dzl_shortcut_theme_remove_css_resource;
	int function(DzlShortcutTheme* self, GFile* file, GCancellable* cancellable, GError** err) c_dzl_shortcut_theme_save_to_file;
	int function(DzlShortcutTheme* self, const(char)* path, GCancellable* cancellable, GError** err) c_dzl_shortcut_theme_save_to_path;
	int function(DzlShortcutTheme* self, GOutputStream* stream, GCancellable* cancellable, GError** err) c_dzl_shortcut_theme_save_to_stream;
	void function(DzlShortcutTheme* self, const(char)* detailedActionName, const(char)* accel, DzlShortcutPhase phase) c_dzl_shortcut_theme_set_accel_for_action;
	void function(DzlShortcutTheme* self, const(char)* command, const(char)* accel, DzlShortcutPhase phase) c_dzl_shortcut_theme_set_accel_for_command;
	void function(DzlShortcutTheme* self, const(char)* detailedActionName, DzlShortcutChord* chord, DzlShortcutPhase phase) c_dzl_shortcut_theme_set_chord_for_action;
	void function(DzlShortcutTheme* self, const(char)* command, DzlShortcutChord* chord, DzlShortcutPhase phase) c_dzl_shortcut_theme_set_chord_for_command;
	void function(DzlShortcutTheme* self, const(char)* parentName) c_dzl_shortcut_theme_set_parent_name;

	// dazzle.ShortcutThemeEditor

	GType function() c_dzl_shortcut_theme_editor_get_type;
	GtkWidget* function() c_dzl_shortcut_theme_editor_new;
	DzlShortcutTheme* function(DzlShortcutThemeEditor* self) c_dzl_shortcut_theme_editor_get_theme;
	void function(DzlShortcutThemeEditor* self, DzlShortcutTheme* theme) c_dzl_shortcut_theme_editor_set_theme;

	// dazzle.ShortcutTooltip

	GType function() c_dzl_shortcut_tooltip_get_type;
	DzlShortcutTooltip* function() c_dzl_shortcut_tooltip_new;
	const(char)* function(DzlShortcutTooltip* self) c_dzl_shortcut_tooltip_get_accel;
	const(char)* function(DzlShortcutTooltip* self) c_dzl_shortcut_tooltip_get_command_id;
	const(char)* function(DzlShortcutTooltip* self) c_dzl_shortcut_tooltip_get_title;
	GtkWidget* function(DzlShortcutTooltip* self) c_dzl_shortcut_tooltip_get_widget;
	void function(DzlShortcutTooltip* self, const(char)* accel) c_dzl_shortcut_tooltip_set_accel;
	void function(DzlShortcutTooltip* self, const(char)* commandId) c_dzl_shortcut_tooltip_set_command_id;
	void function(DzlShortcutTooltip* self, const(char)* title) c_dzl_shortcut_tooltip_set_title;
	void function(DzlShortcutTooltip* self, GtkWidget* widget) c_dzl_shortcut_tooltip_set_widget;

	// dazzle.ShortcutsGroup

	GType function() c_dzl_shortcuts_group_get_type;

	// dazzle.ShortcutsSection

	GType function() c_dzl_shortcuts_section_get_type;

	// dazzle.ShortcutsShortcut

	GType function() c_dzl_shortcuts_shortcut_get_type;

	// dazzle.ShortcutsWindow

	GType function() c_dzl_shortcuts_window_get_type;

	// dazzle.SignalGroup

	GType function() c_dzl_signal_group_get_type;
	DzlSignalGroup* function(GType targetType) c_dzl_signal_group_new;
	void function(DzlSignalGroup* self) c_dzl_signal_group_block;
	void function(DzlSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* data) c_dzl_signal_group_connect;
	void function(DzlSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* data) c_dzl_signal_group_connect_after;
	void function(DzlSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* data, GClosureNotify notify, GConnectFlags flags) c_dzl_signal_group_connect_data;
	void function(DzlSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* object, GConnectFlags flags) c_dzl_signal_group_connect_object;
	void function(DzlSignalGroup* self, const(char)* detailedSignal, GCallback cHandler, void* data) c_dzl_signal_group_connect_swapped;
	void* function(DzlSignalGroup* self) c_dzl_signal_group_get_target;
	void function(DzlSignalGroup* self, void* target) c_dzl_signal_group_set_target;
	void function(DzlSignalGroup* self) c_dzl_signal_group_unblock;

	// dazzle.SimpleLabel

	GType function() c_dzl_simple_label_get_type;
	GtkWidget* function(const(char)* label) c_dzl_simple_label_new;
	const(char)* function(DzlSimpleLabel* self) c_dzl_simple_label_get_label;
	int function(DzlSimpleLabel* self) c_dzl_simple_label_get_width_chars;
	float function(DzlSimpleLabel* self) c_dzl_simple_label_get_xalign;
	void function(DzlSimpleLabel* self, const(char)* label) c_dzl_simple_label_set_label;
	void function(DzlSimpleLabel* self, int widthChars) c_dzl_simple_label_set_width_chars;
	void function(DzlSimpleLabel* self, float xalign) c_dzl_simple_label_set_xalign;

	// dazzle.SimplePopover

	GType function() c_dzl_simple_popover_get_type;
	GtkWidget* function() c_dzl_simple_popover_new;
	const(char)* function(DzlSimplePopover* self) c_dzl_simple_popover_get_button_text;
	const(char)* function(DzlSimplePopover* self) c_dzl_simple_popover_get_message;
	int function(DzlSimplePopover* self) c_dzl_simple_popover_get_ready;
	const(char)* function(DzlSimplePopover* self) c_dzl_simple_popover_get_text;
	const(char)* function(DzlSimplePopover* self) c_dzl_simple_popover_get_title;
	void function(DzlSimplePopover* self, const(char)* buttonText) c_dzl_simple_popover_set_button_text;
	void function(DzlSimplePopover* self, const(char)* message) c_dzl_simple_popover_set_message;
	void function(DzlSimplePopover* self, int ready) c_dzl_simple_popover_set_ready;
	void function(DzlSimplePopover* self, const(char)* text) c_dzl_simple_popover_set_text;
	void function(DzlSimplePopover* self, const(char)* title) c_dzl_simple_popover_set_title;

	// dazzle.Slider

	GType function() c_dzl_slider_get_type;
	GtkWidget* function() c_dzl_slider_new;
	void function(DzlSlider* self, GtkWidget* widget, DzlSliderPosition position) c_dzl_slider_add_slider;
	DzlSliderPosition function(DzlSlider* self) c_dzl_slider_get_position;
	void function(DzlSlider* self, DzlSliderPosition position) c_dzl_slider_set_position;

	// dazzle.StackList

	GType function() c_dzl_stack_list_get_type;
	GtkWidget* function() c_dzl_stack_list_new;
	void function(DzlStackList* self) c_dzl_stack_list_clear;
	uint function(DzlStackList* self) c_dzl_stack_list_get_depth;
	GListModel* function(DzlStackList* self) c_dzl_stack_list_get_model;
	void function(DzlStackList* self) c_dzl_stack_list_pop;
	void function(DzlStackList* self, GtkWidget* header, GListModel* model, DzlStackListCreateWidgetFunc createWidgetFunc, void* userData, GDestroyNotify userDataFreeFunc) c_dzl_stack_list_push;

	// dazzle.StateMachine

	GType function() c_dzl_state_machine_get_type;
	DzlStateMachine* function() c_dzl_state_machine_new;
	void function(GtkBuildableIface* iface) c_dzl_state_machine_buildable_iface_init;
	void function(DzlStateMachine* self, const(char)* state, void* sourceObject, const(char)* sourceProperty, void* targetObject, const(char)* targetProperty, GBindingFlags flags) c_dzl_state_machine_add_binding;
	void function(DzlStateMachine* self, const(char)* state, void* object, const(char)* property, ... ) c_dzl_state_machine_add_property;
	void function(DzlStateMachine* self, const(char)* state, void* object, const(char)* property, void* varArgs) c_dzl_state_machine_add_property_valist;
	void function(DzlStateMachine* self, const(char)* state, void* object, const(char)* property, GValue* value) c_dzl_state_machine_add_propertyv;
	void function(DzlStateMachine* self, const(char)* state, GtkWidget* widget, const(char)* style) c_dzl_state_machine_add_style;
	void function(DzlStateMachine* self, const(char)* state, void* source, const(char)* detailedSignal, GCallback callback, void* userData, GConnectFlags flags) c_dzl_state_machine_connect_object;
	GAction* function(DzlStateMachine* self, const(char)* name) c_dzl_state_machine_create_action;
	const(char)* function(DzlStateMachine* self) c_dzl_state_machine_get_state;
	int function(DzlStateMachine* self, const(char)* state) c_dzl_state_machine_is_state;
	void function(DzlStateMachine* self, const(char)* state) c_dzl_state_machine_set_state;

	// dazzle.Suggestion

	GType function() c_dzl_suggestion_get_type;
	DzlSuggestion* function() c_dzl_suggestion_new;
	GIcon* function(DzlSuggestion* self) c_dzl_suggestion_get_icon;
	const(char)* function(DzlSuggestion* self) c_dzl_suggestion_get_icon_name;
	cairo_surface_t* function(DzlSuggestion* self, GtkWidget* widget) c_dzl_suggestion_get_icon_surface;
	const(char)* function(DzlSuggestion* self) c_dzl_suggestion_get_id;
	const(char)* function(DzlSuggestion* self) c_dzl_suggestion_get_subtitle;
	const(char)* function(DzlSuggestion* self) c_dzl_suggestion_get_title;
	char* function(DzlSuggestion* self, const(char)* typedText) c_dzl_suggestion_replace_typed_text;
	void function(DzlSuggestion* self, const(char)* iconName) c_dzl_suggestion_set_icon_name;
	void function(DzlSuggestion* self, const(char)* id) c_dzl_suggestion_set_id;
	void function(DzlSuggestion* self, const(char)* subtitle) c_dzl_suggestion_set_subtitle;
	void function(DzlSuggestion* self, const(char)* title) c_dzl_suggestion_set_title;
	char* function(DzlSuggestion* self, const(char)* typedText) c_dzl_suggestion_suggest_suffix;

	// dazzle.SuggestionButton

	GType function() c_dzl_suggestion_button_get_type;
	GtkWidget* function() c_dzl_suggestion_button_new;
	GtkButton* function(DzlSuggestionButton* self) c_dzl_suggestion_button_get_button;
	DzlSuggestionEntry* function(DzlSuggestionButton* self) c_dzl_suggestion_button_get_entry;

	// dazzle.SuggestionEntry

	GType function() c_dzl_suggestion_entry_get_type;
	GtkWidget* function() c_dzl_suggestion_entry_new;
	void function(DzlSuggestionEntry* self, GdkRectangle* area, int* isAbsolute, void* userData) c_dzl_suggestion_entry_default_position_func;
	int function(DzlSuggestionEntry* self) c_dzl_suggestion_entry_get_activate_on_single_click;
	int function(DzlSuggestionEntry* self) c_dzl_suggestion_entry_get_compact;
	GListModel* function(DzlSuggestionEntry* self) c_dzl_suggestion_entry_get_model;
	GtkWidget* function(DzlSuggestionEntry* self) c_dzl_suggestion_entry_get_popover;
	DzlSuggestion* function(DzlSuggestionEntry* self) c_dzl_suggestion_entry_get_suggestion;
	const(char)* function(DzlSuggestionEntry* self) c_dzl_suggestion_entry_get_typed_text;
	void function(DzlSuggestionEntry* self) c_dzl_suggestion_entry_hide_suggestions;
	void function(DzlSuggestionEntry* self, int activateOnSingleClick) c_dzl_suggestion_entry_set_activate_on_single_click;
	void function(DzlSuggestionEntry* self, int compact) c_dzl_suggestion_entry_set_compact;
	void function(DzlSuggestionEntry* self, GListModel* model) c_dzl_suggestion_entry_set_model;
	void function(DzlSuggestionEntry* self, DzlSuggestionPositionFunc func, void* funcData, GDestroyNotify funcDataDestroy) c_dzl_suggestion_entry_set_position_func;
	void function(DzlSuggestionEntry* self, DzlSuggestion* suggestion) c_dzl_suggestion_entry_set_suggestion;
	void function(DzlSuggestionEntry* self, GdkRectangle* area, int* isAbsolute, void* userData) c_dzl_suggestion_entry_window_position_func;

	// dazzle.SuggestionEntryBuffer

	GType function() c_dzl_suggestion_entry_buffer_get_type;
	DzlSuggestionEntryBuffer* function() c_dzl_suggestion_entry_buffer_new;
	void function(DzlSuggestionEntryBuffer* self) c_dzl_suggestion_entry_buffer_clear;
	void function(DzlSuggestionEntryBuffer* self) c_dzl_suggestion_entry_buffer_commit;
	DzlSuggestion* function(DzlSuggestionEntryBuffer* self) c_dzl_suggestion_entry_buffer_get_suggestion;
	uint function(DzlSuggestionEntryBuffer* self) c_dzl_suggestion_entry_buffer_get_typed_length;
	const(char)* function(DzlSuggestionEntryBuffer* self) c_dzl_suggestion_entry_buffer_get_typed_text;
	void function(DzlSuggestionEntryBuffer* self, DzlSuggestion* suggestion) c_dzl_suggestion_entry_buffer_set_suggestion;

	// dazzle.SuggestionPopover

	GType function() c_dzl_suggestion_popover_get_type;
	GtkWidget* function() c_dzl_suggestion_popover_new;
	void function(DzlSuggestionPopover* self) c_dzl_suggestion_popover_activate_selected;
	GListModel* function(DzlSuggestionPopover* self) c_dzl_suggestion_popover_get_model;
	GtkWidget* function(DzlSuggestionPopover* self) c_dzl_suggestion_popover_get_relative_to;
	DzlSuggestion* function(DzlSuggestionPopover* self) c_dzl_suggestion_popover_get_selected;
	void function(DzlSuggestionPopover* self, int amount) c_dzl_suggestion_popover_move_by;
	void function(DzlSuggestionPopover* self) c_dzl_suggestion_popover_popdown;
	void function(DzlSuggestionPopover* self) c_dzl_suggestion_popover_popup;
	void function(DzlSuggestionPopover* self, GListModel* model) c_dzl_suggestion_popover_set_model;
	void function(DzlSuggestionPopover* self, GtkWidget* widget) c_dzl_suggestion_popover_set_relative_to;
	void function(DzlSuggestionPopover* self, DzlSuggestion* suggestion) c_dzl_suggestion_popover_set_selected;

	// dazzle.SuggestionRow

	GType function() c_dzl_suggestion_row_get_type;
	GtkWidget* function() c_dzl_suggestion_row_new;
	DzlSuggestion* function(DzlSuggestionRow* self) c_dzl_suggestion_row_get_suggestion;
	void function(DzlSuggestionRow* self, DzlSuggestion* suggestion) c_dzl_suggestion_row_set_suggestion;

	// dazzle.Tab

	GType function() c_dzl_tab_get_type;
	int function(DzlTab* self) c_dzl_tab_get_active;
	int function(DzlTab* self) c_dzl_tab_get_can_close;
	GtkPositionType function(DzlTab* self) c_dzl_tab_get_edge;
	const(char)* function(DzlTab* self) c_dzl_tab_get_icon_name;
	DzlTabStyle function(DzlTab* self) c_dzl_tab_get_style;
	const(char)* function(DzlTab* self) c_dzl_tab_get_title;
	GtkWidget* function(DzlTab* self) c_dzl_tab_get_widget;
	void function(DzlTab* self, int active) c_dzl_tab_set_active;
	void function(DzlTab* self, int canClose) c_dzl_tab_set_can_close;
	void function(DzlTab* self, GtkPositionType edge) c_dzl_tab_set_edge;
	void function(DzlTab* self, GIcon* gicon) c_dzl_tab_set_gicon;
	void function(DzlTab* self, const(char)* iconName) c_dzl_tab_set_icon_name;
	void function(DzlTab* self, DzlTabStyle style) c_dzl_tab_set_style;
	void function(DzlTab* self, const(char)* title) c_dzl_tab_set_title;
	void function(DzlTab* self, GtkWidget* widget) c_dzl_tab_set_widget;

	// dazzle.TabStrip

	GType function() c_dzl_tab_strip_get_type;
	GtkWidget* function() c_dzl_tab_strip_new;
	void function(DzlTabStrip* self, GtkWidget* widget) c_dzl_tab_strip_add_control;
	GtkPositionType function(DzlTabStrip* self) c_dzl_tab_strip_get_edge;
	GtkStack* function(DzlTabStrip* self) c_dzl_tab_strip_get_stack;
	DzlTabStyle function(DzlTabStrip* self) c_dzl_tab_strip_get_style;
	void function(DzlTabStrip* self, GtkPositionType edge) c_dzl_tab_strip_set_edge;
	void function(DzlTabStrip* self, GtkStack* stack) c_dzl_tab_strip_set_stack;
	void function(DzlTabStrip* self, DzlTabStyle style) c_dzl_tab_strip_set_style;

	// dazzle.TaskCache

	GType function() c_dzl_task_cache_get_type;
	DzlTaskCache* function(GHashFunc keyHashFunc, GEqualFunc keyEqualFunc, GBoxedCopyFunc keyCopyFunc, GBoxedFreeFunc keyDestroyFunc, GBoxedCopyFunc valueCopyFunc, GBoxedFreeFunc valueFreeFunc, long timeToLiveMsec, DzlTaskCacheCallback populateCallback, void* populateCallbackData, GDestroyNotify populateCallbackDataDestroy) c_dzl_task_cache_new;
	int function(DzlTaskCache* self, void* key) c_dzl_task_cache_evict;
	void function(DzlTaskCache* self) c_dzl_task_cache_evict_all;
	void function(DzlTaskCache* self, void* key, int forceUpdate, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_dzl_task_cache_get_async;
	void* function(DzlTaskCache* self, GAsyncResult* result, GError** err) c_dzl_task_cache_get_finish;
	GPtrArray* function(DzlTaskCache* self) c_dzl_task_cache_get_values;
	void* function(DzlTaskCache* self, void* key) c_dzl_task_cache_peek;
	void function(DzlTaskCache* self, const(char)* name) c_dzl_task_cache_set_name;

	// dazzle.ThemeManager

	GType function() c_dzl_theme_manager_get_type;
	DzlThemeManager* function() c_dzl_theme_manager_new;
	void function(DzlThemeManager* self, const(char)* resourcePath) c_dzl_theme_manager_add_resources;
	void function(DzlThemeManager* self, const(char)* resourcePath) c_dzl_theme_manager_remove_resources;

	// dazzle.ThreeGrid

	GType function() c_dzl_three_grid_get_type;
	GtkWidget* function() c_dzl_three_grid_new;

	// dazzle.Tree

	GType function() c_dzl_tree_get_type;
	void function(DzlTree* self, DzlTreeBuilder* builder) c_dzl_tree_add_builder;
	void function(DzlTree* self, DzlTreeNode* node) c_dzl_tree_expand_to_node;
	DzlTreeNode* function(DzlTree* self, DzlTreeNode* node, DzlTreeFindFunc findFunc, void* userData) c_dzl_tree_find_child_node;
	DzlTreeNode* function(DzlTree* self, GEqualFunc equalFunc, void* key) c_dzl_tree_find_custom;
	DzlTreeNode* function(DzlTree* self, GObject* item) c_dzl_tree_find_item;
	GMenuModel* function(DzlTree* self) c_dzl_tree_get_context_menu;
	DzlTreeNode* function(DzlTree* self) c_dzl_tree_get_root;
	DzlTreeNode* function(DzlTree* self) c_dzl_tree_get_selected;
	int function(DzlTree* self) c_dzl_tree_get_show_icons;
	void function(DzlTree* self) c_dzl_tree_rebuild;
	void function(DzlTree* self, DzlTreeBuilder* builder) c_dzl_tree_remove_builder;
	void function(DzlTree* self, DzlTreeNode* node) c_dzl_tree_scroll_to_node;
	void function(DzlTree* self, GMenuModel* contextMenu) c_dzl_tree_set_context_menu;
	void function(DzlTree* self, DzlTreeFilterFunc filterFunc, void* filterData, GDestroyNotify filterDataDestroy) c_dzl_tree_set_filter;
	void function(DzlTree* self, DzlTreeNode* node) c_dzl_tree_set_root;
	void function(DzlTree* self, int showIcons) c_dzl_tree_set_show_icons;
	void function(DzlTree* self) c_dzl_tree_unselect_all;

	// dazzle.TreeBuilder

	GType function() c_dzl_tree_builder_get_type;
	DzlTreeBuilder* function() c_dzl_tree_builder_new;
	DzlTree* function(DzlTreeBuilder* builder) c_dzl_tree_builder_get_tree;

	// dazzle.TreeNode

	GType function() c_dzl_tree_node_get_type;
	DzlTreeNode* function() c_dzl_tree_node_new;
	void function(DzlTreeNode* self, const(char)* emblemName) c_dzl_tree_node_add_emblem;
	void function(DzlTreeNode* node, DzlTreeNode* child) c_dzl_tree_node_append;
	void function(DzlTreeNode* self) c_dzl_tree_node_clear_emblems;
	void function(DzlTreeNode* node) c_dzl_tree_node_collapse;
	int function(DzlTreeNode* node, int expandAncestors) c_dzl_tree_node_expand;
	void function(DzlTreeNode* node, GdkRectangle* area) c_dzl_tree_node_get_area;
	int function(DzlTreeNode* self) c_dzl_tree_node_get_children_possible;
	int function(DzlTreeNode* node) c_dzl_tree_node_get_expanded;
	GdkRGBA* function(DzlTreeNode* self) c_dzl_tree_node_get_foreground_rgba;
	GIcon* function(DzlTreeNode* self) c_dzl_tree_node_get_gicon;
	const(char)* function(DzlTreeNode* node) c_dzl_tree_node_get_icon_name;
	GObject* function(DzlTreeNode* node) c_dzl_tree_node_get_item;
	int function(DzlTreeNode* node, GtkTreeIter* iter) c_dzl_tree_node_get_iter;
	DzlTreeNode* function(DzlTreeNode* node) c_dzl_tree_node_get_parent;
	GtkTreePath* function(DzlTreeNode* node) c_dzl_tree_node_get_path;
	int function(DzlTreeNode* self) c_dzl_tree_node_get_reset_on_collapse;
	const(char)* function(DzlTreeNode* node) c_dzl_tree_node_get_text;
	DzlTree* function(DzlTreeNode* node) c_dzl_tree_node_get_tree;
	int function(DzlTreeNode* self) c_dzl_tree_node_get_use_dim_label;
	int function(DzlTreeNode* self) c_dzl_tree_node_get_use_markup;
	int function(DzlTreeNode* self, const(char)* emblemName) c_dzl_tree_node_has_emblem;
	void function(DzlTreeNode* self, DzlTreeNode* child, uint position) c_dzl_tree_node_insert;
	void function(DzlTreeNode* node, DzlTreeNode* child, DzlTreeNodeCompareFunc compareFunc, void* userData) c_dzl_tree_node_insert_sorted;
	void function(DzlTreeNode* node) c_dzl_tree_node_invalidate;
	int function(DzlTreeNode* node) c_dzl_tree_node_is_root;
	uint function(DzlTreeNode* self) c_dzl_tree_node_n_children;
	DzlTreeNode* function(DzlTreeNode* self, uint nth) c_dzl_tree_node_nth_child;
	void function(DzlTreeNode* node, DzlTreeNode* child) c_dzl_tree_node_prepend;
	void function(DzlTreeNode* self) c_dzl_tree_node_rebuild;
	void function(DzlTreeNode* node, DzlTreeNode* child) c_dzl_tree_node_remove;
	void function(DzlTreeNode* self, const(char)* emblemName) c_dzl_tree_node_remove_emblem;
	void function(DzlTreeNode* node) c_dzl_tree_node_select;
	void function(DzlTreeNode* self, int childrenPossible) c_dzl_tree_node_set_children_possible;
	void function(DzlTreeNode* self, const(char)* emblems) c_dzl_tree_node_set_emblems;
	void function(DzlTreeNode* self, GdkRGBA* foregroundRgba) c_dzl_tree_node_set_foreground_rgba;
	void function(DzlTreeNode* self, GIcon* icon) c_dzl_tree_node_set_gicon;
	void function(DzlTreeNode* node, const(char)* iconName) c_dzl_tree_node_set_icon_name;
	void function(DzlTreeNode* node, GObject* item) c_dzl_tree_node_set_item;
	void function(DzlTreeNode* self, int resetOnCollapse) c_dzl_tree_node_set_reset_on_collapse;
	void function(DzlTreeNode* node, const(char)* text) c_dzl_tree_node_set_text;
	void function(DzlTreeNode* self, int useDimLabel) c_dzl_tree_node_set_use_dim_label;
	void function(DzlTreeNode* self, int useMarkup) c_dzl_tree_node_set_use_markup;
	void function(DzlTreeNode* node, GtkPopover* popover) c_dzl_tree_node_show_popover;

	// dazzle.Trie

	GType function() c_dzl_trie_get_type;
	DzlTrie* function(GDestroyNotify valueDestroy) c_dzl_trie_new;
	void function(DzlTrie* trie) c_dzl_trie_destroy;
	void function(DzlTrie* trie, const(char)* key, void* value) c_dzl_trie_insert;
	void* function(DzlTrie* trie, const(char)* key) c_dzl_trie_lookup;
	DzlTrie* function(DzlTrie* trie) c_dzl_trie_ref;
	int function(DzlTrie* trie, const(char)* key) c_dzl_trie_remove;
	void function(DzlTrie* trie, const(char)* key, GTraverseType order, GTraverseFlags flags, int maxDepth, DzlTrieTraverseFunc func, void* userData) c_dzl_trie_traverse;
	void function(DzlTrie* trie) c_dzl_trie_unref;

	// dazzle.WidgetActionGroup

	GType function() c_dzl_widget_action_group_get_type;
	void function(void* widget, const(char)* groupName) c_dzl_widget_action_group_attach;
	GActionGroup* function(GtkWidget* widget) c_dzl_widget_action_group_new;
	void function(DzlWidgetActionGroup* self, const(char)* actionName, int enabled) c_dzl_widget_action_group_set_action_enabled;
}


// dazzle.Animation

alias c_dzl_animation_get_type dzl_animation_get_type;
alias c_dzl_animation_calculate_duration dzl_animation_calculate_duration;
alias c_dzl_animation_add_property dzl_animation_add_property;
alias c_dzl_animation_start dzl_animation_start;
alias c_dzl_animation_stop dzl_animation_stop;

// dazzle.Application

alias c_dzl_application_get_type dzl_application_get_type;
alias c_dzl_application_new dzl_application_new;
alias c_dzl_application_add_resources dzl_application_add_resources;
alias c_dzl_application_get_menu_by_id dzl_application_get_menu_by_id;
alias c_dzl_application_get_menu_manager dzl_application_get_menu_manager;
alias c_dzl_application_get_shortcut_manager dzl_application_get_shortcut_manager;
alias c_dzl_application_get_theme_manager dzl_application_get_theme_manager;
alias c_dzl_application_remove_resources dzl_application_remove_resources;

// dazzle.ApplicationWindow

alias c_dzl_application_window_get_type dzl_application_window_get_type;
alias c_dzl_application_window_get_fullscreen dzl_application_window_get_fullscreen;
alias c_dzl_application_window_get_titlebar dzl_application_window_get_titlebar;
alias c_dzl_application_window_set_fullscreen dzl_application_window_set_fullscreen;
alias c_dzl_application_window_set_titlebar dzl_application_window_set_titlebar;

// dazzle.Bin

alias c_dzl_bin_get_type dzl_bin_get_type;
alias c_dzl_bin_new dzl_bin_new;

// dazzle.BindingGroup

alias c_dzl_binding_group_get_type dzl_binding_group_get_type;
alias c_dzl_binding_group_new dzl_binding_group_new;
alias c_dzl_binding_group_bind dzl_binding_group_bind;
alias c_dzl_binding_group_bind_full dzl_binding_group_bind_full;
alias c_dzl_binding_group_bind_with_closures dzl_binding_group_bind_with_closures;
alias c_dzl_binding_group_get_source dzl_binding_group_get_source;
alias c_dzl_binding_group_set_source dzl_binding_group_set_source;

// dazzle.BoldingLabel

alias c_dzl_bolding_label_get_type dzl_bolding_label_get_type;
alias c_dzl_bolding_label_new dzl_bolding_label_new;
alias c_dzl_bolding_label_new_with_mnemonic dzl_bolding_label_new_with_mnemonic;
alias c_dzl_bolding_label_set_bold dzl_bolding_label_set_bold;
alias c_dzl_bolding_label_set_weight dzl_bolding_label_set_weight;

// dazzle.Box

alias c_dzl_box_get_type dzl_box_get_type;
alias c_dzl_box_new dzl_box_new;
alias c_dzl_box_get_max_width_request dzl_box_get_max_width_request;
alias c_dzl_box_get_nth_child dzl_box_get_nth_child;
alias c_dzl_box_set_max_width_request dzl_box_set_max_width_request;

// dazzle.BoxTheatric

alias c_dzl_box_theatric_get_type dzl_box_theatric_get_type;

// dazzle.CenteringBin

alias c_dzl_centering_bin_get_type dzl_centering_bin_get_type;
alias c_dzl_centering_bin_new dzl_centering_bin_new;

// dazzle.ChildPropertyAction

alias c_dzl_child_property_action_get_type dzl_child_property_action_get_type;
alias c_dzl_child_property_action_new dzl_child_property_action_new;

// dazzle.ColumnLayout

alias c_dzl_column_layout_get_type dzl_column_layout_get_type;
alias c_dzl_column_layout_new dzl_column_layout_new;
alias c_dzl_column_layout_get_column_spacing dzl_column_layout_get_column_spacing;
alias c_dzl_column_layout_get_column_width dzl_column_layout_get_column_width;
alias c_dzl_column_layout_get_max_columns dzl_column_layout_get_max_columns;
alias c_dzl_column_layout_get_row_spacing dzl_column_layout_get_row_spacing;
alias c_dzl_column_layout_set_column_spacing dzl_column_layout_set_column_spacing;
alias c_dzl_column_layout_set_column_width dzl_column_layout_set_column_width;
alias c_dzl_column_layout_set_max_columns dzl_column_layout_set_max_columns;
alias c_dzl_column_layout_set_row_spacing dzl_column_layout_set_row_spacing;

// dazzle.Counter

alias c_dzl_counter_get dzl_counter_get;
alias c_dzl_counter_reset dzl_counter_reset;

// dazzle.CounterArena

alias c_dzl_counter_arena_get_type dzl_counter_arena_get_type;
alias c_dzl_counter_arena_new_for_pid dzl_counter_arena_new_for_pid;
alias c_dzl_counter_arena_foreach dzl_counter_arena_foreach;
alias c_dzl_counter_arena_ref dzl_counter_arena_ref;
alias c_dzl_counter_arena_register dzl_counter_arena_register;
alias c_dzl_counter_arena_unref dzl_counter_arena_unref;
alias c_dzl_counter_arena_get_default dzl_counter_arena_get_default;

// dazzle.CountersWindow

alias c_dzl_counters_window_get_type dzl_counters_window_get_type;
alias c_dzl_counters_window_new dzl_counters_window_new;
alias c_dzl_counters_window_get_arena dzl_counters_window_get_arena;
alias c_dzl_counters_window_set_arena dzl_counters_window_set_arena;

// dazzle.CpuGraph

alias c_dzl_cpu_graph_get_type dzl_cpu_graph_get_type;
alias c_dzl_cpu_graph_new_full dzl_cpu_graph_new_full;

// dazzle.CpuModel

alias c_dzl_cpu_model_get_type dzl_cpu_model_get_type;
alias c_dzl_cpu_model_new dzl_cpu_model_new;

// dazzle.CssProvider

alias c_dzl_css_provider_get_type dzl_css_provider_get_type;
alias c_dzl_css_provider_new dzl_css_provider_new;

// dazzle.DirectoryModel

alias c_dzl_directory_model_get_type dzl_directory_model_get_type;
alias c_dzl_directory_model_new dzl_directory_model_new;
alias c_dzl_directory_model_get_directory dzl_directory_model_get_directory;
alias c_dzl_directory_model_set_directory dzl_directory_model_set_directory;
alias c_dzl_directory_model_set_visible_func dzl_directory_model_set_visible_func;

// dazzle.DirectoryReaper

alias c_dzl_directory_reaper_get_type dzl_directory_reaper_get_type;
alias c_dzl_directory_reaper_new dzl_directory_reaper_new;
alias c_dzl_directory_reaper_add_directory dzl_directory_reaper_add_directory;
alias c_dzl_directory_reaper_add_file dzl_directory_reaper_add_file;
alias c_dzl_directory_reaper_add_glob dzl_directory_reaper_add_glob;
alias c_dzl_directory_reaper_execute dzl_directory_reaper_execute;
alias c_dzl_directory_reaper_execute_async dzl_directory_reaper_execute_async;
alias c_dzl_directory_reaper_execute_finish dzl_directory_reaper_execute_finish;

// dazzle.Dock

alias c_dzl_dock_get_type dzl_dock_get_type;

// dazzle.DockBin

alias c_dzl_dock_bin_get_type dzl_dock_bin_get_type;
alias c_dzl_dock_bin_new dzl_dock_bin_new;
alias c_dzl_dock_bin_get_bottom_edge dzl_dock_bin_get_bottom_edge;
alias c_dzl_dock_bin_get_center_widget dzl_dock_bin_get_center_widget;
alias c_dzl_dock_bin_get_left_edge dzl_dock_bin_get_left_edge;
alias c_dzl_dock_bin_get_right_edge dzl_dock_bin_get_right_edge;
alias c_dzl_dock_bin_get_top_edge dzl_dock_bin_get_top_edge;

// dazzle.DockBinEdge

alias c_dzl_dock_bin_edge_get_type dzl_dock_bin_edge_get_type;
alias c_dzl_dock_bin_edge_get_edge dzl_dock_bin_edge_get_edge;

// dazzle.DockItem

alias c_dzl_dock_item_get_type dzl_dock_item_get_type;
alias c_dzl_dock_item_adopt dzl_dock_item_adopt;
alias c_dzl_dock_item_close dzl_dock_item_close;
alias c_dzl_dock_item_emit_presented dzl_dock_item_emit_presented;
alias c_dzl_dock_item_get_can_close dzl_dock_item_get_can_close;
alias c_dzl_dock_item_get_can_minimize dzl_dock_item_get_can_minimize;
alias c_dzl_dock_item_get_child_visible dzl_dock_item_get_child_visible;
alias c_dzl_dock_item_get_icon_name dzl_dock_item_get_icon_name;
alias c_dzl_dock_item_get_manager dzl_dock_item_get_manager;
alias c_dzl_dock_item_get_parent dzl_dock_item_get_parent;
alias c_dzl_dock_item_get_title dzl_dock_item_get_title;
alias c_dzl_dock_item_has_widgets dzl_dock_item_has_widgets;
alias c_dzl_dock_item_minimize dzl_dock_item_minimize;
alias c_dzl_dock_item_needs_attention dzl_dock_item_needs_attention;
alias c_dzl_dock_item_present dzl_dock_item_present;
alias c_dzl_dock_item_present_child dzl_dock_item_present_child;
alias c_dzl_dock_item_ref_gicon dzl_dock_item_ref_gicon;
alias c_dzl_dock_item_release dzl_dock_item_release;
alias c_dzl_dock_item_set_child_visible dzl_dock_item_set_child_visible;
alias c_dzl_dock_item_set_manager dzl_dock_item_set_manager;
alias c_dzl_dock_item_update_visibility dzl_dock_item_update_visibility;

// dazzle.DockManager

alias c_dzl_dock_manager_get_type dzl_dock_manager_get_type;
alias c_dzl_dock_manager_new dzl_dock_manager_new;
alias c_dzl_dock_manager_pause_grabs dzl_dock_manager_pause_grabs;
alias c_dzl_dock_manager_register_dock dzl_dock_manager_register_dock;
alias c_dzl_dock_manager_release_transient_grab dzl_dock_manager_release_transient_grab;
alias c_dzl_dock_manager_unpause_grabs dzl_dock_manager_unpause_grabs;
alias c_dzl_dock_manager_unregister_dock dzl_dock_manager_unregister_dock;

// dazzle.DockOverlay

alias c_dzl_dock_overlay_get_type dzl_dock_overlay_get_type;
alias c_dzl_dock_overlay_new dzl_dock_overlay_new;
alias c_dzl_dock_overlay_get_edge dzl_dock_overlay_get_edge;
alias c_dzl_dock_overlay_get_edge_adjustment dzl_dock_overlay_get_edge_adjustment;

// dazzle.DockOverlayEdge

alias c_dzl_dock_overlay_edge_get_type dzl_dock_overlay_edge_get_type;
alias c_dzl_dock_overlay_edge_get_edge dzl_dock_overlay_edge_get_edge;
alias c_dzl_dock_overlay_edge_get_position dzl_dock_overlay_edge_get_position;
alias c_dzl_dock_overlay_edge_set_edge dzl_dock_overlay_edge_set_edge;
alias c_dzl_dock_overlay_edge_set_position dzl_dock_overlay_edge_set_position;

// dazzle.DockPaned

alias c_dzl_dock_paned_get_type dzl_dock_paned_get_type;
alias c_dzl_dock_paned_new dzl_dock_paned_new;

// dazzle.DockRevealer

alias c_dzl_dock_revealer_get_type dzl_dock_revealer_get_type;
alias c_dzl_dock_revealer_new dzl_dock_revealer_new;
alias c_dzl_dock_revealer_animate_to_position dzl_dock_revealer_animate_to_position;
alias c_dzl_dock_revealer_get_child_revealed dzl_dock_revealer_get_child_revealed;
alias c_dzl_dock_revealer_get_position dzl_dock_revealer_get_position;
alias c_dzl_dock_revealer_get_position_set dzl_dock_revealer_get_position_set;
alias c_dzl_dock_revealer_get_reveal_child dzl_dock_revealer_get_reveal_child;
alias c_dzl_dock_revealer_get_transition_duration dzl_dock_revealer_get_transition_duration;
alias c_dzl_dock_revealer_get_transition_type dzl_dock_revealer_get_transition_type;
alias c_dzl_dock_revealer_is_animating dzl_dock_revealer_is_animating;
alias c_dzl_dock_revealer_set_position dzl_dock_revealer_set_position;
alias c_dzl_dock_revealer_set_position_set dzl_dock_revealer_set_position_set;
alias c_dzl_dock_revealer_set_reveal_child dzl_dock_revealer_set_reveal_child;
alias c_dzl_dock_revealer_set_transition_duration dzl_dock_revealer_set_transition_duration;
alias c_dzl_dock_revealer_set_transition_type dzl_dock_revealer_set_transition_type;

// dazzle.DockStack

alias c_dzl_dock_stack_get_type dzl_dock_stack_get_type;
alias c_dzl_dock_stack_new dzl_dock_stack_new;
alias c_dzl_dock_stack_get_edge dzl_dock_stack_get_edge;
alias c_dzl_dock_stack_get_show_pinned_button dzl_dock_stack_get_show_pinned_button;
alias c_dzl_dock_stack_get_style dzl_dock_stack_get_style;
alias c_dzl_dock_stack_set_edge dzl_dock_stack_set_edge;
alias c_dzl_dock_stack_set_show_pinned_button dzl_dock_stack_set_show_pinned_button;
alias c_dzl_dock_stack_set_style dzl_dock_stack_set_style;

// dazzle.DockTransientGrab

alias c_dzl_dock_transient_grab_get_type dzl_dock_transient_grab_get_type;
alias c_dzl_dock_transient_grab_new dzl_dock_transient_grab_new;
alias c_dzl_dock_transient_grab_acquire dzl_dock_transient_grab_acquire;
alias c_dzl_dock_transient_grab_add_item dzl_dock_transient_grab_add_item;
alias c_dzl_dock_transient_grab_cancel dzl_dock_transient_grab_cancel;
alias c_dzl_dock_transient_grab_contains dzl_dock_transient_grab_contains;
alias c_dzl_dock_transient_grab_get_timeout dzl_dock_transient_grab_get_timeout;
alias c_dzl_dock_transient_grab_is_descendant dzl_dock_transient_grab_is_descendant;
alias c_dzl_dock_transient_grab_release dzl_dock_transient_grab_release;
alias c_dzl_dock_transient_grab_remove_item dzl_dock_transient_grab_remove_item;
alias c_dzl_dock_transient_grab_set_timeout dzl_dock_transient_grab_set_timeout;
alias c_dzl_dock_transient_grab_steal_common_ancestors dzl_dock_transient_grab_steal_common_ancestors;

// dazzle.DockWidget

alias c_dzl_dock_widget_get_type dzl_dock_widget_get_type;
alias c_dzl_dock_widget_new dzl_dock_widget_new;
alias c_dzl_dock_widget_set_gicon dzl_dock_widget_set_gicon;
alias c_dzl_dock_widget_set_icon_name dzl_dock_widget_set_icon_name;
alias c_dzl_dock_widget_set_title dzl_dock_widget_set_title;

// dazzle.DockWindow

alias c_dzl_dock_window_get_type dzl_dock_window_get_type;
alias c_dzl_dock_window_new dzl_dock_window_new;

// dazzle.ElasticBin

alias c_dzl_elastic_bin_get_type dzl_elastic_bin_get_type;
alias c_dzl_elastic_bin_new dzl_elastic_bin_new;

// dazzle.EmptyState

alias c_dzl_empty_state_get_type dzl_empty_state_get_type;
alias c_dzl_empty_state_new dzl_empty_state_new;
alias c_dzl_empty_state_get_icon_name dzl_empty_state_get_icon_name;
alias c_dzl_empty_state_get_subtitle dzl_empty_state_get_subtitle;
alias c_dzl_empty_state_get_title dzl_empty_state_get_title;
alias c_dzl_empty_state_set_icon_name dzl_empty_state_set_icon_name;
alias c_dzl_empty_state_set_resource dzl_empty_state_set_resource;
alias c_dzl_empty_state_set_subtitle dzl_empty_state_set_subtitle;
alias c_dzl_empty_state_set_title dzl_empty_state_set_title;

// dazzle.EntryBox

alias c_dzl_entry_box_get_type dzl_entry_box_get_type;
alias c_dzl_entry_box_new dzl_entry_box_new;

// dazzle.FileChooserEntry

alias c_dzl_file_chooser_entry_get_type dzl_file_chooser_entry_get_type;
alias c_dzl_file_chooser_entry_new dzl_file_chooser_entry_new;
alias c_dzl_file_chooser_entry_get_entry dzl_file_chooser_entry_get_entry;
alias c_dzl_file_chooser_entry_get_file dzl_file_chooser_entry_get_file;
alias c_dzl_file_chooser_entry_set_file dzl_file_chooser_entry_set_file;

// dazzle.FileTransfer

alias c_dzl_file_transfer_get_type dzl_file_transfer_get_type;
alias c_dzl_file_transfer_new dzl_file_transfer_new;
alias c_dzl_file_transfer_add dzl_file_transfer_add;
alias c_dzl_file_transfer_execute dzl_file_transfer_execute;
alias c_dzl_file_transfer_execute_async dzl_file_transfer_execute_async;
alias c_dzl_file_transfer_execute_finish dzl_file_transfer_execute_finish;
alias c_dzl_file_transfer_get_flags dzl_file_transfer_get_flags;
alias c_dzl_file_transfer_get_progress dzl_file_transfer_get_progress;
alias c_dzl_file_transfer_set_flags dzl_file_transfer_set_flags;
alias c_dzl_file_transfer_stat dzl_file_transfer_stat;

// dazzle.FuzzyIndex

alias c_dzl_fuzzy_index_get_type dzl_fuzzy_index_get_type;
alias c_dzl_fuzzy_index_new dzl_fuzzy_index_new;
alias c_dzl_fuzzy_index_get_metadata dzl_fuzzy_index_get_metadata;
alias c_dzl_fuzzy_index_get_metadata_string dzl_fuzzy_index_get_metadata_string;
alias c_dzl_fuzzy_index_get_metadata_uint32 dzl_fuzzy_index_get_metadata_uint32;
alias c_dzl_fuzzy_index_get_metadata_uint64 dzl_fuzzy_index_get_metadata_uint64;
alias c_dzl_fuzzy_index_load_file dzl_fuzzy_index_load_file;
alias c_dzl_fuzzy_index_load_file_async dzl_fuzzy_index_load_file_async;
alias c_dzl_fuzzy_index_load_file_finish dzl_fuzzy_index_load_file_finish;
alias c_dzl_fuzzy_index_query_async dzl_fuzzy_index_query_async;
alias c_dzl_fuzzy_index_query_finish dzl_fuzzy_index_query_finish;

// dazzle.FuzzyIndexBuilder

alias c_dzl_fuzzy_index_builder_get_type dzl_fuzzy_index_builder_get_type;
alias c_dzl_fuzzy_index_builder_new dzl_fuzzy_index_builder_new;
alias c_dzl_fuzzy_index_builder_get_case_sensitive dzl_fuzzy_index_builder_get_case_sensitive;
alias c_dzl_fuzzy_index_builder_get_document dzl_fuzzy_index_builder_get_document;
alias c_dzl_fuzzy_index_builder_insert dzl_fuzzy_index_builder_insert;
alias c_dzl_fuzzy_index_builder_set_case_sensitive dzl_fuzzy_index_builder_set_case_sensitive;
alias c_dzl_fuzzy_index_builder_set_metadata dzl_fuzzy_index_builder_set_metadata;
alias c_dzl_fuzzy_index_builder_set_metadata_string dzl_fuzzy_index_builder_set_metadata_string;
alias c_dzl_fuzzy_index_builder_set_metadata_uint32 dzl_fuzzy_index_builder_set_metadata_uint32;
alias c_dzl_fuzzy_index_builder_set_metadata_uint64 dzl_fuzzy_index_builder_set_metadata_uint64;
alias c_dzl_fuzzy_index_builder_write dzl_fuzzy_index_builder_write;
alias c_dzl_fuzzy_index_builder_write_async dzl_fuzzy_index_builder_write_async;
alias c_dzl_fuzzy_index_builder_write_finish dzl_fuzzy_index_builder_write_finish;

// dazzle.FuzzyIndexCursor

alias c_dzl_fuzzy_index_cursor_get_type dzl_fuzzy_index_cursor_get_type;
alias c_dzl_fuzzy_index_cursor_get_index dzl_fuzzy_index_cursor_get_index;

// dazzle.FuzzyIndexMatch

alias c_dzl_fuzzy_index_match_get_type dzl_fuzzy_index_match_get_type;
alias c_dzl_fuzzy_index_match_get_document dzl_fuzzy_index_match_get_document;
alias c_dzl_fuzzy_index_match_get_key dzl_fuzzy_index_match_get_key;
alias c_dzl_fuzzy_index_match_get_priority dzl_fuzzy_index_match_get_priority;
alias c_dzl_fuzzy_index_match_get_score dzl_fuzzy_index_match_get_score;

// dazzle.FuzzyMutableIndex

alias c_dzl_fuzzy_mutable_index_get_type dzl_fuzzy_mutable_index_get_type;
alias c_dzl_fuzzy_mutable_index_new dzl_fuzzy_mutable_index_new;
alias c_dzl_fuzzy_mutable_index_new_with_free_func dzl_fuzzy_mutable_index_new_with_free_func;
alias c_dzl_fuzzy_mutable_index_begin_bulk_insert dzl_fuzzy_mutable_index_begin_bulk_insert;
alias c_dzl_fuzzy_mutable_index_contains dzl_fuzzy_mutable_index_contains;
alias c_dzl_fuzzy_mutable_index_end_bulk_insert dzl_fuzzy_mutable_index_end_bulk_insert;
alias c_dzl_fuzzy_mutable_index_insert dzl_fuzzy_mutable_index_insert;
alias c_dzl_fuzzy_mutable_index_match dzl_fuzzy_mutable_index_match;
alias c_dzl_fuzzy_mutable_index_ref dzl_fuzzy_mutable_index_ref;
alias c_dzl_fuzzy_mutable_index_remove dzl_fuzzy_mutable_index_remove;
alias c_dzl_fuzzy_mutable_index_set_free_func dzl_fuzzy_mutable_index_set_free_func;
alias c_dzl_fuzzy_mutable_index_unref dzl_fuzzy_mutable_index_unref;

// dazzle.GraphColumn

alias c_dzl_graph_view_column_get_type dzl_graph_view_column_get_type;
alias c_dzl_graph_view_column_new dzl_graph_view_column_new;
alias c_dzl_graph_view_column_get_name dzl_graph_view_column_get_name;
alias c_dzl_graph_view_column_set_name dzl_graph_view_column_set_name;

// dazzle.GraphLineRenderer

alias c_dzl_graph_view_line_renderer_get_type dzl_graph_view_line_renderer_get_type;
alias c_dzl_graph_view_line_renderer_new dzl_graph_view_line_renderer_new;
alias c_dzl_graph_view_line_renderer_get_stroke_color_rgba dzl_graph_view_line_renderer_get_stroke_color_rgba;
alias c_dzl_graph_view_line_renderer_set_stroke_color dzl_graph_view_line_renderer_set_stroke_color;
alias c_dzl_graph_view_line_renderer_set_stroke_color_rgba dzl_graph_view_line_renderer_set_stroke_color_rgba;

// dazzle.GraphModel

alias c_dzl_graph_view_model_get_type dzl_graph_view_model_get_type;
alias c_dzl_graph_view_model_new dzl_graph_view_model_new;
alias c_dzl_graph_view_model_iter_get dzl_graph_view_model_iter_get;
alias c_dzl_graph_view_model_iter_get_timestamp dzl_graph_view_model_iter_get_timestamp;
alias c_dzl_graph_view_model_iter_get_value dzl_graph_view_model_iter_get_value;
alias c_dzl_graph_view_model_iter_next dzl_graph_view_model_iter_next;
alias c_dzl_graph_view_model_iter_set dzl_graph_view_model_iter_set;
alias c_dzl_graph_view_model_iter_set_value dzl_graph_view_model_iter_set_value;
alias c_dzl_graph_view_model_add_column dzl_graph_view_model_add_column;
alias c_dzl_graph_view_model_get_end_time dzl_graph_view_model_get_end_time;
alias c_dzl_graph_view_model_get_iter_first dzl_graph_view_model_get_iter_first;
alias c_dzl_graph_view_model_get_iter_last dzl_graph_view_model_get_iter_last;
alias c_dzl_graph_view_model_get_max_samples dzl_graph_view_model_get_max_samples;
alias c_dzl_graph_view_model_get_n_columns dzl_graph_view_model_get_n_columns;
alias c_dzl_graph_view_model_get_timespan dzl_graph_view_model_get_timespan;
alias c_dzl_graph_view_model_push dzl_graph_view_model_push;
alias c_dzl_graph_view_model_set_max_samples dzl_graph_view_model_set_max_samples;
alias c_dzl_graph_view_model_set_timespan dzl_graph_view_model_set_timespan;

// dazzle.GraphRenderer

alias c_dzl_graph_view_renderer_get_type dzl_graph_view_renderer_get_type;
alias c_dzl_graph_view_renderer_render dzl_graph_view_renderer_render;

// dazzle.GraphView

alias c_dzl_graph_view_get_type dzl_graph_view_get_type;
alias c_dzl_graph_view_new dzl_graph_view_new;
alias c_dzl_graph_view_add_renderer dzl_graph_view_add_renderer;
alias c_dzl_graph_view_get_model dzl_graph_view_get_model;
alias c_dzl_graph_view_set_model dzl_graph_view_set_model;

// dazzle.Heap

alias c_dzl_heap_get_type dzl_heap_get_type;
alias c_dzl_heap_new dzl_heap_new;
alias c_dzl_heap_extract dzl_heap_extract;
alias c_dzl_heap_extract_index dzl_heap_extract_index;
alias c_dzl_heap_insert_vals dzl_heap_insert_vals;
alias c_dzl_heap_ref dzl_heap_ref;
alias c_dzl_heap_unref dzl_heap_unref;

// dazzle.JoinedMenu

alias c_dzl_joined_menu_get_type dzl_joined_menu_get_type;
alias c_dzl_joined_menu_new dzl_joined_menu_new;
alias c_dzl_joined_menu_append_menu dzl_joined_menu_append_menu;
alias c_dzl_joined_menu_get_n_joined dzl_joined_menu_get_n_joined;
alias c_dzl_joined_menu_prepend_menu dzl_joined_menu_prepend_menu;
alias c_dzl_joined_menu_remove_index dzl_joined_menu_remove_index;
alias c_dzl_joined_menu_remove_menu dzl_joined_menu_remove_menu;

// dazzle.ListBox

alias c_dzl_list_box_get_type dzl_list_box_get_type;
alias c_dzl_list_box_new dzl_list_box_new;
alias c_dzl_list_box_get_model dzl_list_box_get_model;
alias c_dzl_list_box_get_property_name dzl_list_box_get_property_name;
alias c_dzl_list_box_get_row_type dzl_list_box_get_row_type;
alias c_dzl_list_box_set_model dzl_list_box_set_model;
alias c_dzl_list_box_set_recycle_max dzl_list_box_set_recycle_max;

// dazzle.ListBoxRow

alias c_dzl_list_box_row_get_type dzl_list_box_row_get_type;

// dazzle.ListModelFilter

alias c_dzl_list_model_filter_get_type dzl_list_model_filter_get_type;
alias c_dzl_list_model_filter_new dzl_list_model_filter_new;
alias c_dzl_list_model_filter_get_child_model dzl_list_model_filter_get_child_model;
alias c_dzl_list_model_filter_invalidate dzl_list_model_filter_invalidate;
alias c_dzl_list_model_filter_set_filter_func dzl_list_model_filter_set_filter_func;

// dazzle.ListStoreAdapter

alias c_dzl_list_store_adapter_get_type dzl_list_store_adapter_get_type;
alias c_dzl_list_store_adapter_new dzl_list_store_adapter_new;
alias c_dzl_list_store_adapter_get_model dzl_list_store_adapter_get_model;
alias c_dzl_list_store_adapter_set_model dzl_list_store_adapter_set_model;

// dazzle.MenuButton

alias c_dzl_menu_button_get_type dzl_menu_button_get_type;
alias c_dzl_menu_button_new_with_model dzl_menu_button_new_with_model;
alias c_dzl_menu_button_get_model dzl_menu_button_get_model;
alias c_dzl_menu_button_get_show_accels dzl_menu_button_get_show_accels;
alias c_dzl_menu_button_get_show_arrow dzl_menu_button_get_show_arrow;
alias c_dzl_menu_button_get_show_icons dzl_menu_button_get_show_icons;
alias c_dzl_menu_button_set_model dzl_menu_button_set_model;
alias c_dzl_menu_button_set_show_accels dzl_menu_button_set_show_accels;
alias c_dzl_menu_button_set_show_arrow dzl_menu_button_set_show_arrow;
alias c_dzl_menu_button_set_show_icons dzl_menu_button_set_show_icons;

// dazzle.MenuManager

alias c_dzl_menu_manager_get_type dzl_menu_manager_get_type;
alias c_dzl_menu_manager_new dzl_menu_manager_new;
alias c_dzl_menu_manager_add_filename dzl_menu_manager_add_filename;
alias c_dzl_menu_manager_add_resource dzl_menu_manager_add_resource;
alias c_dzl_menu_manager_get_menu_by_id dzl_menu_manager_get_menu_by_id;
alias c_dzl_menu_manager_merge dzl_menu_manager_merge;
alias c_dzl_menu_manager_remove dzl_menu_manager_remove;

// dazzle.MultiPaned

alias c_dzl_multi_paned_get_type dzl_multi_paned_get_type;
alias c_dzl_multi_paned_new dzl_multi_paned_new;
alias c_dzl_multi_paned_get_at_point dzl_multi_paned_get_at_point;
alias c_dzl_multi_paned_get_n_children dzl_multi_paned_get_n_children;
alias c_dzl_multi_paned_get_nth_child dzl_multi_paned_get_nth_child;

// dazzle.Path

alias c_dzl_path_get_type dzl_path_get_type;
alias c_dzl_path_new dzl_path_new;
alias c_dzl_path_append dzl_path_append;
alias c_dzl_path_get_element dzl_path_get_element;
alias c_dzl_path_get_elements dzl_path_get_elements;
alias c_dzl_path_get_length dzl_path_get_length;
alias c_dzl_path_has_prefix dzl_path_has_prefix;
alias c_dzl_path_is_empty dzl_path_is_empty;
alias c_dzl_path_prepend dzl_path_prepend;
alias c_dzl_path_printf dzl_path_printf;

// dazzle.PathBar

alias c_dzl_path_bar_get_type dzl_path_bar_get_type;
alias c_dzl_path_bar_new dzl_path_bar_new;
alias c_dzl_path_bar_get_path dzl_path_bar_get_path;
alias c_dzl_path_bar_set_path dzl_path_bar_set_path;
alias c_dzl_path_bar_set_selected_index dzl_path_bar_set_selected_index;

// dazzle.PathElement

alias c_dzl_path_element_get_type dzl_path_element_get_type;
alias c_dzl_path_element_new dzl_path_element_new;
alias c_dzl_path_element_get_icon_name dzl_path_element_get_icon_name;
alias c_dzl_path_element_get_id dzl_path_element_get_id;
alias c_dzl_path_element_get_title dzl_path_element_get_title;

// dazzle.PatternSpec

alias c_dzl_pattern_spec_get_type dzl_pattern_spec_get_type;
alias c_dzl_pattern_spec_new dzl_pattern_spec_new;
alias c_dzl_pattern_spec_get_text dzl_pattern_spec_get_text;
alias c_dzl_pattern_spec_match dzl_pattern_spec_match;
alias c_dzl_pattern_spec_ref dzl_pattern_spec_ref;
alias c_dzl_pattern_spec_unref dzl_pattern_spec_unref;

// dazzle.PillBox

alias c_dzl_pill_box_get_type dzl_pill_box_get_type;
alias c_dzl_pill_box_new dzl_pill_box_new;
alias c_dzl_pill_box_get_label dzl_pill_box_get_label;
alias c_dzl_pill_box_set_label dzl_pill_box_set_label;

// dazzle.Preferences

alias c_dzl_preferences_get_type dzl_preferences_get_type;
alias c_dzl_preferences_add_custom dzl_preferences_add_custom;
alias c_dzl_preferences_add_file_chooser dzl_preferences_add_file_chooser;
alias c_dzl_preferences_add_font_button dzl_preferences_add_font_button;
alias c_dzl_preferences_add_group dzl_preferences_add_group;
alias c_dzl_preferences_add_list_group dzl_preferences_add_list_group;
alias c_dzl_preferences_add_page dzl_preferences_add_page;
alias c_dzl_preferences_add_radio dzl_preferences_add_radio;
alias c_dzl_preferences_add_spin_button dzl_preferences_add_spin_button;
alias c_dzl_preferences_add_switch dzl_preferences_add_switch;
alias c_dzl_preferences_add_table_row dzl_preferences_add_table_row;
alias c_dzl_preferences_get_widget dzl_preferences_get_widget;
alias c_dzl_preferences_remove_id dzl_preferences_remove_id;
alias c_dzl_preferences_set_page dzl_preferences_set_page;

// dazzle.PreferencesBin

alias c_dzl_preferences_bin_get_type dzl_preferences_bin_get_type;

// dazzle.PreferencesEntry

alias c_dzl_preferences_entry_get_type dzl_preferences_entry_get_type;
alias c_dzl_preferences_entry_get_entry_widget dzl_preferences_entry_get_entry_widget;
alias c_dzl_preferences_entry_get_title_widget dzl_preferences_entry_get_title_widget;

// dazzle.PreferencesFileChooserButton

alias c_dzl_preferences_file_chooser_button_get_type dzl_preferences_file_chooser_button_get_type;

// dazzle.PreferencesFlowBox

alias c_dzl_preferences_flow_box_get_type dzl_preferences_flow_box_get_type;
alias c_dzl_preferences_flow_box_new dzl_preferences_flow_box_new;

// dazzle.PreferencesFontButton

alias c_dzl_preferences_font_button_get_type dzl_preferences_font_button_get_type;

// dazzle.PreferencesGroup

alias c_dzl_preferences_group_get_type dzl_preferences_group_get_type;
alias c_dzl_preferences_group_add dzl_preferences_group_add;
alias c_dzl_preferences_group_get_priority dzl_preferences_group_get_priority;
alias c_dzl_preferences_group_get_size_group dzl_preferences_group_get_size_group;
alias c_dzl_preferences_group_get_title dzl_preferences_group_get_title;
alias c_dzl_preferences_group_refilter dzl_preferences_group_refilter;
alias c_dzl_preferences_group_set_map dzl_preferences_group_set_map;

// dazzle.PreferencesPage

alias c_dzl_preferences_page_get_type dzl_preferences_page_get_type;
alias c_dzl_preferences_page_add_group dzl_preferences_page_add_group;
alias c_dzl_preferences_page_get_group dzl_preferences_page_get_group;
alias c_dzl_preferences_page_refilter dzl_preferences_page_refilter;
alias c_dzl_preferences_page_set_map dzl_preferences_page_set_map;

// dazzle.PreferencesSpinButton

alias c_dzl_preferences_spin_button_get_type dzl_preferences_spin_button_get_type;
alias c_dzl_preferences_spin_button_get_spin_button dzl_preferences_spin_button_get_spin_button;

// dazzle.PreferencesSwitch

alias c_dzl_preferences_switch_get_type dzl_preferences_switch_get_type;

// dazzle.PreferencesView

alias c_dzl_preferences_view_get_type dzl_preferences_view_get_type;
alias c_dzl_preferences_view_new dzl_preferences_view_new;
alias c_dzl_preferences_view_get_show_search_entry dzl_preferences_view_get_show_search_entry;
alias c_dzl_preferences_view_get_use_sidebar dzl_preferences_view_get_use_sidebar;
alias c_dzl_preferences_view_reapply_filter dzl_preferences_view_reapply_filter;
alias c_dzl_preferences_view_set_show_search_entry dzl_preferences_view_set_show_search_entry;
alias c_dzl_preferences_view_set_use_sidebar dzl_preferences_view_set_use_sidebar;

// dazzle.PriorityBox

alias c_dzl_priority_box_get_type dzl_priority_box_get_type;
alias c_dzl_priority_box_new dzl_priority_box_new;

// dazzle.ProgressButton

alias c_dzl_progress_button_get_type dzl_progress_button_get_type;
alias c_dzl_progress_button_new dzl_progress_button_new;
alias c_dzl_progress_button_get_progress dzl_progress_button_get_progress;
alias c_dzl_progress_button_get_show_progress dzl_progress_button_get_show_progress;
alias c_dzl_progress_button_set_progress dzl_progress_button_set_progress;
alias c_dzl_progress_button_set_show_progress dzl_progress_button_set_show_progress;

// dazzle.ProgressIcon

alias c_dzl_progress_icon_get_type dzl_progress_icon_get_type;
alias c_dzl_progress_icon_new dzl_progress_icon_new;
alias c_dzl_progress_icon_get_progress dzl_progress_icon_get_progress;
alias c_dzl_progress_icon_set_progress dzl_progress_icon_set_progress;

// dazzle.ProgressMenuButton

alias c_dzl_progress_menu_button_get_type dzl_progress_menu_button_get_type;
alias c_dzl_progress_menu_button_new dzl_progress_menu_button_new;
alias c_dzl_progress_menu_button_get_progress dzl_progress_menu_button_get_progress;
alias c_dzl_progress_menu_button_get_show_progress dzl_progress_menu_button_get_show_progress;
alias c_dzl_progress_menu_button_get_show_theatric dzl_progress_menu_button_get_show_theatric;
alias c_dzl_progress_menu_button_reset_theatrics dzl_progress_menu_button_reset_theatrics;
alias c_dzl_progress_menu_button_set_progress dzl_progress_menu_button_set_progress;
alias c_dzl_progress_menu_button_set_show_progress dzl_progress_menu_button_set_show_progress;
alias c_dzl_progress_menu_button_set_show_theatric dzl_progress_menu_button_set_show_theatric;

// dazzle.PropertiesGroup

alias c_dzl_properties_group_get_type dzl_properties_group_get_type;
alias c_dzl_properties_group_new dzl_properties_group_new;
alias c_dzl_properties_group_new_for_type dzl_properties_group_new_for_type;
alias c_dzl_properties_group_add_all_properties dzl_properties_group_add_all_properties;
alias c_dzl_properties_group_add_property dzl_properties_group_add_property;
alias c_dzl_properties_group_add_property_full dzl_properties_group_add_property_full;
alias c_dzl_properties_group_remove dzl_properties_group_remove;

// dazzle.RadioBox

alias c_dzl_radio_box_get_type dzl_radio_box_get_type;
alias c_dzl_radio_box_new dzl_radio_box_new;
alias c_dzl_radio_box_add_item dzl_radio_box_add_item;
alias c_dzl_radio_box_get_active_id dzl_radio_box_get_active_id;
alias c_dzl_radio_box_remove_item dzl_radio_box_remove_item;
alias c_dzl_radio_box_set_active_id dzl_radio_box_set_active_id;

// dazzle.ReadOnlyListModel

alias c_dzl_read_only_list_model_get_type dzl_read_only_list_model_get_type;
alias c_dzl_read_only_list_model_new dzl_read_only_list_model_new;

// dazzle.RecursiveFileMonitor

alias c_dzl_recursive_file_monitor_get_type dzl_recursive_file_monitor_get_type;
alias c_dzl_recursive_file_monitor_new dzl_recursive_file_monitor_new;
alias c_dzl_recursive_file_monitor_cancel dzl_recursive_file_monitor_cancel;
alias c_dzl_recursive_file_monitor_get_root dzl_recursive_file_monitor_get_root;
alias c_dzl_recursive_file_monitor_set_ignore_func dzl_recursive_file_monitor_set_ignore_func;
alias c_dzl_recursive_file_monitor_start_async dzl_recursive_file_monitor_start_async;
alias c_dzl_recursive_file_monitor_start_finish dzl_recursive_file_monitor_start_finish;

// dazzle.Ring

alias c_dzl_ring_get_type dzl_ring_get_type;
alias c_dzl_ring_sized_new dzl_ring_sized_new;
alias c_dzl_ring_append_vals dzl_ring_append_vals;
alias c_dzl_ring_foreach dzl_ring_foreach;
alias c_dzl_ring_ref dzl_ring_ref;
alias c_dzl_ring_unref dzl_ring_unref;

// dazzle.ScrolledWindow

alias c_dzl_scrolled_window_get_type dzl_scrolled_window_get_type;

// dazzle.SearchBar

alias c_dzl_search_bar_get_type dzl_search_bar_get_type;
alias c_dzl_search_bar_new dzl_search_bar_new;
alias c_dzl_search_bar_get_entry dzl_search_bar_get_entry;
alias c_dzl_search_bar_get_search_mode_enabled dzl_search_bar_get_search_mode_enabled;
alias c_dzl_search_bar_get_show_close_button dzl_search_bar_get_show_close_button;
alias c_dzl_search_bar_set_search_mode_enabled dzl_search_bar_set_search_mode_enabled;
alias c_dzl_search_bar_set_show_close_button dzl_search_bar_set_show_close_button;

// dazzle.SettingsFlagAction

alias c_dzl_settings_flag_action_get_type dzl_settings_flag_action_get_type;
alias c_dzl_settings_flag_action_new dzl_settings_flag_action_new;

// dazzle.SettingsSandwich

alias c_dzl_settings_sandwich_get_type dzl_settings_sandwich_get_type;
alias c_dzl_settings_sandwich_new dzl_settings_sandwich_new;
alias c_dzl_settings_sandwich_append dzl_settings_sandwich_append;
alias c_dzl_settings_sandwich_bind dzl_settings_sandwich_bind;
alias c_dzl_settings_sandwich_bind_with_mapping dzl_settings_sandwich_bind_with_mapping;
alias c_dzl_settings_sandwich_get_boolean dzl_settings_sandwich_get_boolean;
alias c_dzl_settings_sandwich_get_default_value dzl_settings_sandwich_get_default_value;
alias c_dzl_settings_sandwich_get_double dzl_settings_sandwich_get_double;
alias c_dzl_settings_sandwich_get_int dzl_settings_sandwich_get_int;
alias c_dzl_settings_sandwich_get_string dzl_settings_sandwich_get_string;
alias c_dzl_settings_sandwich_get_uint dzl_settings_sandwich_get_uint;
alias c_dzl_settings_sandwich_get_user_value dzl_settings_sandwich_get_user_value;
alias c_dzl_settings_sandwich_get_value dzl_settings_sandwich_get_value;
alias c_dzl_settings_sandwich_set_boolean dzl_settings_sandwich_set_boolean;
alias c_dzl_settings_sandwich_set_double dzl_settings_sandwich_set_double;
alias c_dzl_settings_sandwich_set_int dzl_settings_sandwich_set_int;
alias c_dzl_settings_sandwich_set_string dzl_settings_sandwich_set_string;
alias c_dzl_settings_sandwich_set_uint dzl_settings_sandwich_set_uint;
alias c_dzl_settings_sandwich_set_value dzl_settings_sandwich_set_value;
alias c_dzl_settings_sandwich_unbind dzl_settings_sandwich_unbind;

// dazzle.ShortcutAccelDialog

alias c_dzl_shortcut_accel_dialog_get_type dzl_shortcut_accel_dialog_get_type;
alias c_dzl_shortcut_accel_dialog_new dzl_shortcut_accel_dialog_new;
alias c_dzl_shortcut_accel_dialog_get_accelerator dzl_shortcut_accel_dialog_get_accelerator;
alias c_dzl_shortcut_accel_dialog_get_chord dzl_shortcut_accel_dialog_get_chord;
alias c_dzl_shortcut_accel_dialog_get_shortcut_title dzl_shortcut_accel_dialog_get_shortcut_title;
alias c_dzl_shortcut_accel_dialog_set_accelerator dzl_shortcut_accel_dialog_set_accelerator;
alias c_dzl_shortcut_accel_dialog_set_shortcut_title dzl_shortcut_accel_dialog_set_shortcut_title;

// dazzle.ShortcutChord

alias c_dzl_shortcut_chord_get_type dzl_shortcut_chord_get_type;
alias c_dzl_shortcut_chord_new_from_event dzl_shortcut_chord_new_from_event;
alias c_dzl_shortcut_chord_new_from_string dzl_shortcut_chord_new_from_string;
alias c_dzl_shortcut_chord_append_event dzl_shortcut_chord_append_event;
alias c_dzl_shortcut_chord_copy dzl_shortcut_chord_copy;
alias c_dzl_shortcut_chord_free dzl_shortcut_chord_free;
alias c_dzl_shortcut_chord_get_label dzl_shortcut_chord_get_label;
alias c_dzl_shortcut_chord_get_length dzl_shortcut_chord_get_length;
alias c_dzl_shortcut_chord_get_nth_key dzl_shortcut_chord_get_nth_key;
alias c_dzl_shortcut_chord_has_modifier dzl_shortcut_chord_has_modifier;
alias c_dzl_shortcut_chord_match dzl_shortcut_chord_match;
alias c_dzl_shortcut_chord_to_string dzl_shortcut_chord_to_string;
alias c_dzl_shortcut_chord_equal dzl_shortcut_chord_equal;
alias c_dzl_shortcut_chord_hash dzl_shortcut_chord_hash;

// dazzle.ShortcutChordTable

alias c_dzl_shortcut_chord_table_add dzl_shortcut_chord_table_add;
alias c_dzl_shortcut_chord_table_foreach dzl_shortcut_chord_table_foreach;
alias c_dzl_shortcut_chord_table_free dzl_shortcut_chord_table_free;
alias c_dzl_shortcut_chord_table_lookup dzl_shortcut_chord_table_lookup;
alias c_dzl_shortcut_chord_table_lookup_data dzl_shortcut_chord_table_lookup_data;
alias c_dzl_shortcut_chord_table_printf dzl_shortcut_chord_table_printf;
alias c_dzl_shortcut_chord_table_remove dzl_shortcut_chord_table_remove;
alias c_dzl_shortcut_chord_table_remove_data dzl_shortcut_chord_table_remove_data;
alias c_dzl_shortcut_chord_table_set_free_func dzl_shortcut_chord_table_set_free_func;
alias c_dzl_shortcut_chord_table_size dzl_shortcut_chord_table_size;
alias c_dzl_shortcut_chord_table_new dzl_shortcut_chord_table_new;

// dazzle.ShortcutContext

alias c_dzl_shortcut_context_get_type dzl_shortcut_context_get_type;
alias c_dzl_shortcut_context_new dzl_shortcut_context_new;
alias c_dzl_shortcut_context_activate dzl_shortcut_context_activate;
alias c_dzl_shortcut_context_add_action dzl_shortcut_context_add_action;
alias c_dzl_shortcut_context_add_command dzl_shortcut_context_add_command;
alias c_dzl_shortcut_context_add_signal dzl_shortcut_context_add_signal;
alias c_dzl_shortcut_context_add_signal_va_list dzl_shortcut_context_add_signal_va_list;
alias c_dzl_shortcut_context_add_signalv dzl_shortcut_context_add_signalv;
alias c_dzl_shortcut_context_get_name dzl_shortcut_context_get_name;
alias c_dzl_shortcut_context_load_from_data dzl_shortcut_context_load_from_data;
alias c_dzl_shortcut_context_load_from_resource dzl_shortcut_context_load_from_resource;
alias c_dzl_shortcut_context_remove dzl_shortcut_context_remove;

// dazzle.ShortcutController

alias c_dzl_shortcut_controller_get_type dzl_shortcut_controller_get_type;
alias c_dzl_shortcut_controller_new dzl_shortcut_controller_new;
alias c_dzl_shortcut_controller_find dzl_shortcut_controller_find;
alias c_dzl_shortcut_controller_try_find dzl_shortcut_controller_try_find;
alias c_dzl_shortcut_controller_add_command_action dzl_shortcut_controller_add_command_action;
alias c_dzl_shortcut_controller_add_command_callback dzl_shortcut_controller_add_command_callback;
alias c_dzl_shortcut_controller_add_command_signal dzl_shortcut_controller_add_command_signal;
alias c_dzl_shortcut_controller_execute_command dzl_shortcut_controller_execute_command;
alias c_dzl_shortcut_controller_get_context dzl_shortcut_controller_get_context;
alias c_dzl_shortcut_controller_get_context_for_phase dzl_shortcut_controller_get_context_for_phase;
alias c_dzl_shortcut_controller_get_current_chord dzl_shortcut_controller_get_current_chord;
alias c_dzl_shortcut_controller_get_manager dzl_shortcut_controller_get_manager;
alias c_dzl_shortcut_controller_get_widget dzl_shortcut_controller_get_widget;
alias c_dzl_shortcut_controller_remove_accel dzl_shortcut_controller_remove_accel;
alias c_dzl_shortcut_controller_set_context_by_name dzl_shortcut_controller_set_context_by_name;
alias c_dzl_shortcut_controller_set_manager dzl_shortcut_controller_set_manager;

// dazzle.ShortcutLabel

alias c_dzl_shortcut_label_get_type dzl_shortcut_label_get_type;
alias c_dzl_shortcut_label_new dzl_shortcut_label_new;
alias c_dzl_shortcut_label_get_accelerator dzl_shortcut_label_get_accelerator;
alias c_dzl_shortcut_label_get_chord dzl_shortcut_label_get_chord;
alias c_dzl_shortcut_label_set_accelerator dzl_shortcut_label_set_accelerator;
alias c_dzl_shortcut_label_set_chord dzl_shortcut_label_set_chord;

// dazzle.ShortcutManager

alias c_dzl_shortcut_manager_get_type dzl_shortcut_manager_get_type;
alias c_dzl_shortcut_manager_get_default dzl_shortcut_manager_get_default;
alias c_dzl_shortcut_manager_add_action dzl_shortcut_manager_add_action;
alias c_dzl_shortcut_manager_add_command dzl_shortcut_manager_add_command;
alias c_dzl_shortcut_manager_add_shortcut_entries dzl_shortcut_manager_add_shortcut_entries;
alias c_dzl_shortcut_manager_add_shortcuts_to_window dzl_shortcut_manager_add_shortcuts_to_window;
alias c_dzl_shortcut_manager_append_search_path dzl_shortcut_manager_append_search_path;
alias c_dzl_shortcut_manager_get_theme dzl_shortcut_manager_get_theme;
alias c_dzl_shortcut_manager_get_theme_by_name dzl_shortcut_manager_get_theme_by_name;
alias c_dzl_shortcut_manager_get_theme_name dzl_shortcut_manager_get_theme_name;
alias c_dzl_shortcut_manager_get_user_dir dzl_shortcut_manager_get_user_dir;
alias c_dzl_shortcut_manager_handle_event dzl_shortcut_manager_handle_event;
alias c_dzl_shortcut_manager_prepend_search_path dzl_shortcut_manager_prepend_search_path;
alias c_dzl_shortcut_manager_queue_reload dzl_shortcut_manager_queue_reload;
alias c_dzl_shortcut_manager_reload dzl_shortcut_manager_reload;
alias c_dzl_shortcut_manager_remove_search_path dzl_shortcut_manager_remove_search_path;
alias c_dzl_shortcut_manager_set_theme dzl_shortcut_manager_set_theme;
alias c_dzl_shortcut_manager_set_theme_name dzl_shortcut_manager_set_theme_name;
alias c_dzl_shortcut_manager_set_user_dir dzl_shortcut_manager_set_user_dir;

// dazzle.ShortcutModel

alias c_dzl_shortcut_model_get_type dzl_shortcut_model_get_type;
alias c_dzl_shortcut_model_new dzl_shortcut_model_new;
alias c_dzl_shortcut_model_get_manager dzl_shortcut_model_get_manager;
alias c_dzl_shortcut_model_get_theme dzl_shortcut_model_get_theme;
alias c_dzl_shortcut_model_rebuild dzl_shortcut_model_rebuild;
alias c_dzl_shortcut_model_set_chord dzl_shortcut_model_set_chord;
alias c_dzl_shortcut_model_set_manager dzl_shortcut_model_set_manager;
alias c_dzl_shortcut_model_set_theme dzl_shortcut_model_set_theme;

// dazzle.ShortcutSimpleLabel

alias c_dzl_shortcut_simple_label_get_type dzl_shortcut_simple_label_get_type;
alias c_dzl_shortcut_simple_label_new dzl_shortcut_simple_label_new;
alias c_dzl_shortcut_simple_label_get_accel dzl_shortcut_simple_label_get_accel;
alias c_dzl_shortcut_simple_label_get_action dzl_shortcut_simple_label_get_action;
alias c_dzl_shortcut_simple_label_get_command dzl_shortcut_simple_label_get_command;
alias c_dzl_shortcut_simple_label_get_title dzl_shortcut_simple_label_get_title;
alias c_dzl_shortcut_simple_label_set_accel dzl_shortcut_simple_label_set_accel;
alias c_dzl_shortcut_simple_label_set_action dzl_shortcut_simple_label_set_action;
alias c_dzl_shortcut_simple_label_set_command dzl_shortcut_simple_label_set_command;
alias c_dzl_shortcut_simple_label_set_title dzl_shortcut_simple_label_set_title;

// dazzle.ShortcutTheme

alias c_dzl_shortcut_theme_get_type dzl_shortcut_theme_get_type;
alias c_dzl_shortcut_theme_new dzl_shortcut_theme_new;
alias c_dzl_shortcut_theme_add_command dzl_shortcut_theme_add_command;
alias c_dzl_shortcut_theme_add_context dzl_shortcut_theme_add_context;
alias c_dzl_shortcut_theme_add_css_resource dzl_shortcut_theme_add_css_resource;
alias c_dzl_shortcut_theme_find_context_by_name dzl_shortcut_theme_find_context_by_name;
alias c_dzl_shortcut_theme_find_default_context dzl_shortcut_theme_find_default_context;
alias c_dzl_shortcut_theme_get_chord_for_action dzl_shortcut_theme_get_chord_for_action;
alias c_dzl_shortcut_theme_get_chord_for_command dzl_shortcut_theme_get_chord_for_command;
alias c_dzl_shortcut_theme_get_name dzl_shortcut_theme_get_name;
alias c_dzl_shortcut_theme_get_parent dzl_shortcut_theme_get_parent;
alias c_dzl_shortcut_theme_get_parent_name dzl_shortcut_theme_get_parent_name;
alias c_dzl_shortcut_theme_get_subtitle dzl_shortcut_theme_get_subtitle;
alias c_dzl_shortcut_theme_get_title dzl_shortcut_theme_get_title;
alias c_dzl_shortcut_theme_load_from_data dzl_shortcut_theme_load_from_data;
alias c_dzl_shortcut_theme_load_from_file dzl_shortcut_theme_load_from_file;
alias c_dzl_shortcut_theme_load_from_path dzl_shortcut_theme_load_from_path;
alias c_dzl_shortcut_theme_remove_css_resource dzl_shortcut_theme_remove_css_resource;
alias c_dzl_shortcut_theme_save_to_file dzl_shortcut_theme_save_to_file;
alias c_dzl_shortcut_theme_save_to_path dzl_shortcut_theme_save_to_path;
alias c_dzl_shortcut_theme_save_to_stream dzl_shortcut_theme_save_to_stream;
alias c_dzl_shortcut_theme_set_accel_for_action dzl_shortcut_theme_set_accel_for_action;
alias c_dzl_shortcut_theme_set_accel_for_command dzl_shortcut_theme_set_accel_for_command;
alias c_dzl_shortcut_theme_set_chord_for_action dzl_shortcut_theme_set_chord_for_action;
alias c_dzl_shortcut_theme_set_chord_for_command dzl_shortcut_theme_set_chord_for_command;
alias c_dzl_shortcut_theme_set_parent_name dzl_shortcut_theme_set_parent_name;

// dazzle.ShortcutThemeEditor

alias c_dzl_shortcut_theme_editor_get_type dzl_shortcut_theme_editor_get_type;
alias c_dzl_shortcut_theme_editor_new dzl_shortcut_theme_editor_new;
alias c_dzl_shortcut_theme_editor_get_theme dzl_shortcut_theme_editor_get_theme;
alias c_dzl_shortcut_theme_editor_set_theme dzl_shortcut_theme_editor_set_theme;

// dazzle.ShortcutTooltip

alias c_dzl_shortcut_tooltip_get_type dzl_shortcut_tooltip_get_type;
alias c_dzl_shortcut_tooltip_new dzl_shortcut_tooltip_new;
alias c_dzl_shortcut_tooltip_get_accel dzl_shortcut_tooltip_get_accel;
alias c_dzl_shortcut_tooltip_get_command_id dzl_shortcut_tooltip_get_command_id;
alias c_dzl_shortcut_tooltip_get_title dzl_shortcut_tooltip_get_title;
alias c_dzl_shortcut_tooltip_get_widget dzl_shortcut_tooltip_get_widget;
alias c_dzl_shortcut_tooltip_set_accel dzl_shortcut_tooltip_set_accel;
alias c_dzl_shortcut_tooltip_set_command_id dzl_shortcut_tooltip_set_command_id;
alias c_dzl_shortcut_tooltip_set_title dzl_shortcut_tooltip_set_title;
alias c_dzl_shortcut_tooltip_set_widget dzl_shortcut_tooltip_set_widget;

// dazzle.ShortcutsGroup

alias c_dzl_shortcuts_group_get_type dzl_shortcuts_group_get_type;

// dazzle.ShortcutsSection

alias c_dzl_shortcuts_section_get_type dzl_shortcuts_section_get_type;

// dazzle.ShortcutsShortcut

alias c_dzl_shortcuts_shortcut_get_type dzl_shortcuts_shortcut_get_type;

// dazzle.ShortcutsWindow

alias c_dzl_shortcuts_window_get_type dzl_shortcuts_window_get_type;

// dazzle.SignalGroup

alias c_dzl_signal_group_get_type dzl_signal_group_get_type;
alias c_dzl_signal_group_new dzl_signal_group_new;
alias c_dzl_signal_group_block dzl_signal_group_block;
alias c_dzl_signal_group_connect dzl_signal_group_connect;
alias c_dzl_signal_group_connect_after dzl_signal_group_connect_after;
alias c_dzl_signal_group_connect_data dzl_signal_group_connect_data;
alias c_dzl_signal_group_connect_object dzl_signal_group_connect_object;
alias c_dzl_signal_group_connect_swapped dzl_signal_group_connect_swapped;
alias c_dzl_signal_group_get_target dzl_signal_group_get_target;
alias c_dzl_signal_group_set_target dzl_signal_group_set_target;
alias c_dzl_signal_group_unblock dzl_signal_group_unblock;

// dazzle.SimpleLabel

alias c_dzl_simple_label_get_type dzl_simple_label_get_type;
alias c_dzl_simple_label_new dzl_simple_label_new;
alias c_dzl_simple_label_get_label dzl_simple_label_get_label;
alias c_dzl_simple_label_get_width_chars dzl_simple_label_get_width_chars;
alias c_dzl_simple_label_get_xalign dzl_simple_label_get_xalign;
alias c_dzl_simple_label_set_label dzl_simple_label_set_label;
alias c_dzl_simple_label_set_width_chars dzl_simple_label_set_width_chars;
alias c_dzl_simple_label_set_xalign dzl_simple_label_set_xalign;

// dazzle.SimplePopover

alias c_dzl_simple_popover_get_type dzl_simple_popover_get_type;
alias c_dzl_simple_popover_new dzl_simple_popover_new;
alias c_dzl_simple_popover_get_button_text dzl_simple_popover_get_button_text;
alias c_dzl_simple_popover_get_message dzl_simple_popover_get_message;
alias c_dzl_simple_popover_get_ready dzl_simple_popover_get_ready;
alias c_dzl_simple_popover_get_text dzl_simple_popover_get_text;
alias c_dzl_simple_popover_get_title dzl_simple_popover_get_title;
alias c_dzl_simple_popover_set_button_text dzl_simple_popover_set_button_text;
alias c_dzl_simple_popover_set_message dzl_simple_popover_set_message;
alias c_dzl_simple_popover_set_ready dzl_simple_popover_set_ready;
alias c_dzl_simple_popover_set_text dzl_simple_popover_set_text;
alias c_dzl_simple_popover_set_title dzl_simple_popover_set_title;

// dazzle.Slider

alias c_dzl_slider_get_type dzl_slider_get_type;
alias c_dzl_slider_new dzl_slider_new;
alias c_dzl_slider_add_slider dzl_slider_add_slider;
alias c_dzl_slider_get_position dzl_slider_get_position;
alias c_dzl_slider_set_position dzl_slider_set_position;

// dazzle.StackList

alias c_dzl_stack_list_get_type dzl_stack_list_get_type;
alias c_dzl_stack_list_new dzl_stack_list_new;
alias c_dzl_stack_list_clear dzl_stack_list_clear;
alias c_dzl_stack_list_get_depth dzl_stack_list_get_depth;
alias c_dzl_stack_list_get_model dzl_stack_list_get_model;
alias c_dzl_stack_list_pop dzl_stack_list_pop;
alias c_dzl_stack_list_push dzl_stack_list_push;

// dazzle.StateMachine

alias c_dzl_state_machine_get_type dzl_state_machine_get_type;
alias c_dzl_state_machine_new dzl_state_machine_new;
alias c_dzl_state_machine_buildable_iface_init dzl_state_machine_buildable_iface_init;
alias c_dzl_state_machine_add_binding dzl_state_machine_add_binding;
alias c_dzl_state_machine_add_property dzl_state_machine_add_property;
alias c_dzl_state_machine_add_property_valist dzl_state_machine_add_property_valist;
alias c_dzl_state_machine_add_propertyv dzl_state_machine_add_propertyv;
alias c_dzl_state_machine_add_style dzl_state_machine_add_style;
alias c_dzl_state_machine_connect_object dzl_state_machine_connect_object;
alias c_dzl_state_machine_create_action dzl_state_machine_create_action;
alias c_dzl_state_machine_get_state dzl_state_machine_get_state;
alias c_dzl_state_machine_is_state dzl_state_machine_is_state;
alias c_dzl_state_machine_set_state dzl_state_machine_set_state;

// dazzle.Suggestion

alias c_dzl_suggestion_get_type dzl_suggestion_get_type;
alias c_dzl_suggestion_new dzl_suggestion_new;
alias c_dzl_suggestion_get_icon dzl_suggestion_get_icon;
alias c_dzl_suggestion_get_icon_name dzl_suggestion_get_icon_name;
alias c_dzl_suggestion_get_icon_surface dzl_suggestion_get_icon_surface;
alias c_dzl_suggestion_get_id dzl_suggestion_get_id;
alias c_dzl_suggestion_get_subtitle dzl_suggestion_get_subtitle;
alias c_dzl_suggestion_get_title dzl_suggestion_get_title;
alias c_dzl_suggestion_replace_typed_text dzl_suggestion_replace_typed_text;
alias c_dzl_suggestion_set_icon_name dzl_suggestion_set_icon_name;
alias c_dzl_suggestion_set_id dzl_suggestion_set_id;
alias c_dzl_suggestion_set_subtitle dzl_suggestion_set_subtitle;
alias c_dzl_suggestion_set_title dzl_suggestion_set_title;
alias c_dzl_suggestion_suggest_suffix dzl_suggestion_suggest_suffix;

// dazzle.SuggestionButton

alias c_dzl_suggestion_button_get_type dzl_suggestion_button_get_type;
alias c_dzl_suggestion_button_new dzl_suggestion_button_new;
alias c_dzl_suggestion_button_get_button dzl_suggestion_button_get_button;
alias c_dzl_suggestion_button_get_entry dzl_suggestion_button_get_entry;

// dazzle.SuggestionEntry

alias c_dzl_suggestion_entry_get_type dzl_suggestion_entry_get_type;
alias c_dzl_suggestion_entry_new dzl_suggestion_entry_new;
alias c_dzl_suggestion_entry_default_position_func dzl_suggestion_entry_default_position_func;
alias c_dzl_suggestion_entry_get_activate_on_single_click dzl_suggestion_entry_get_activate_on_single_click;
alias c_dzl_suggestion_entry_get_compact dzl_suggestion_entry_get_compact;
alias c_dzl_suggestion_entry_get_model dzl_suggestion_entry_get_model;
alias c_dzl_suggestion_entry_get_popover dzl_suggestion_entry_get_popover;
alias c_dzl_suggestion_entry_get_suggestion dzl_suggestion_entry_get_suggestion;
alias c_dzl_suggestion_entry_get_typed_text dzl_suggestion_entry_get_typed_text;
alias c_dzl_suggestion_entry_hide_suggestions dzl_suggestion_entry_hide_suggestions;
alias c_dzl_suggestion_entry_set_activate_on_single_click dzl_suggestion_entry_set_activate_on_single_click;
alias c_dzl_suggestion_entry_set_compact dzl_suggestion_entry_set_compact;
alias c_dzl_suggestion_entry_set_model dzl_suggestion_entry_set_model;
alias c_dzl_suggestion_entry_set_position_func dzl_suggestion_entry_set_position_func;
alias c_dzl_suggestion_entry_set_suggestion dzl_suggestion_entry_set_suggestion;
alias c_dzl_suggestion_entry_window_position_func dzl_suggestion_entry_window_position_func;

// dazzle.SuggestionEntryBuffer

alias c_dzl_suggestion_entry_buffer_get_type dzl_suggestion_entry_buffer_get_type;
alias c_dzl_suggestion_entry_buffer_new dzl_suggestion_entry_buffer_new;
alias c_dzl_suggestion_entry_buffer_clear dzl_suggestion_entry_buffer_clear;
alias c_dzl_suggestion_entry_buffer_commit dzl_suggestion_entry_buffer_commit;
alias c_dzl_suggestion_entry_buffer_get_suggestion dzl_suggestion_entry_buffer_get_suggestion;
alias c_dzl_suggestion_entry_buffer_get_typed_length dzl_suggestion_entry_buffer_get_typed_length;
alias c_dzl_suggestion_entry_buffer_get_typed_text dzl_suggestion_entry_buffer_get_typed_text;
alias c_dzl_suggestion_entry_buffer_set_suggestion dzl_suggestion_entry_buffer_set_suggestion;

// dazzle.SuggestionPopover

alias c_dzl_suggestion_popover_get_type dzl_suggestion_popover_get_type;
alias c_dzl_suggestion_popover_new dzl_suggestion_popover_new;
alias c_dzl_suggestion_popover_activate_selected dzl_suggestion_popover_activate_selected;
alias c_dzl_suggestion_popover_get_model dzl_suggestion_popover_get_model;
alias c_dzl_suggestion_popover_get_relative_to dzl_suggestion_popover_get_relative_to;
alias c_dzl_suggestion_popover_get_selected dzl_suggestion_popover_get_selected;
alias c_dzl_suggestion_popover_move_by dzl_suggestion_popover_move_by;
alias c_dzl_suggestion_popover_popdown dzl_suggestion_popover_popdown;
alias c_dzl_suggestion_popover_popup dzl_suggestion_popover_popup;
alias c_dzl_suggestion_popover_set_model dzl_suggestion_popover_set_model;
alias c_dzl_suggestion_popover_set_relative_to dzl_suggestion_popover_set_relative_to;
alias c_dzl_suggestion_popover_set_selected dzl_suggestion_popover_set_selected;

// dazzle.SuggestionRow

alias c_dzl_suggestion_row_get_type dzl_suggestion_row_get_type;
alias c_dzl_suggestion_row_new dzl_suggestion_row_new;
alias c_dzl_suggestion_row_get_suggestion dzl_suggestion_row_get_suggestion;
alias c_dzl_suggestion_row_set_suggestion dzl_suggestion_row_set_suggestion;

// dazzle.Tab

alias c_dzl_tab_get_type dzl_tab_get_type;
alias c_dzl_tab_get_active dzl_tab_get_active;
alias c_dzl_tab_get_can_close dzl_tab_get_can_close;
alias c_dzl_tab_get_edge dzl_tab_get_edge;
alias c_dzl_tab_get_icon_name dzl_tab_get_icon_name;
alias c_dzl_tab_get_style dzl_tab_get_style;
alias c_dzl_tab_get_title dzl_tab_get_title;
alias c_dzl_tab_get_widget dzl_tab_get_widget;
alias c_dzl_tab_set_active dzl_tab_set_active;
alias c_dzl_tab_set_can_close dzl_tab_set_can_close;
alias c_dzl_tab_set_edge dzl_tab_set_edge;
alias c_dzl_tab_set_gicon dzl_tab_set_gicon;
alias c_dzl_tab_set_icon_name dzl_tab_set_icon_name;
alias c_dzl_tab_set_style dzl_tab_set_style;
alias c_dzl_tab_set_title dzl_tab_set_title;
alias c_dzl_tab_set_widget dzl_tab_set_widget;

// dazzle.TabStrip

alias c_dzl_tab_strip_get_type dzl_tab_strip_get_type;
alias c_dzl_tab_strip_new dzl_tab_strip_new;
alias c_dzl_tab_strip_add_control dzl_tab_strip_add_control;
alias c_dzl_tab_strip_get_edge dzl_tab_strip_get_edge;
alias c_dzl_tab_strip_get_stack dzl_tab_strip_get_stack;
alias c_dzl_tab_strip_get_style dzl_tab_strip_get_style;
alias c_dzl_tab_strip_set_edge dzl_tab_strip_set_edge;
alias c_dzl_tab_strip_set_stack dzl_tab_strip_set_stack;
alias c_dzl_tab_strip_set_style dzl_tab_strip_set_style;

// dazzle.TaskCache

alias c_dzl_task_cache_get_type dzl_task_cache_get_type;
alias c_dzl_task_cache_new dzl_task_cache_new;
alias c_dzl_task_cache_evict dzl_task_cache_evict;
alias c_dzl_task_cache_evict_all dzl_task_cache_evict_all;
alias c_dzl_task_cache_get_async dzl_task_cache_get_async;
alias c_dzl_task_cache_get_finish dzl_task_cache_get_finish;
alias c_dzl_task_cache_get_values dzl_task_cache_get_values;
alias c_dzl_task_cache_peek dzl_task_cache_peek;
alias c_dzl_task_cache_set_name dzl_task_cache_set_name;

// dazzle.ThemeManager

alias c_dzl_theme_manager_get_type dzl_theme_manager_get_type;
alias c_dzl_theme_manager_new dzl_theme_manager_new;
alias c_dzl_theme_manager_add_resources dzl_theme_manager_add_resources;
alias c_dzl_theme_manager_remove_resources dzl_theme_manager_remove_resources;

// dazzle.ThreeGrid

alias c_dzl_three_grid_get_type dzl_three_grid_get_type;
alias c_dzl_three_grid_new dzl_three_grid_new;

// dazzle.Tree

alias c_dzl_tree_get_type dzl_tree_get_type;
alias c_dzl_tree_add_builder dzl_tree_add_builder;
alias c_dzl_tree_expand_to_node dzl_tree_expand_to_node;
alias c_dzl_tree_find_child_node dzl_tree_find_child_node;
alias c_dzl_tree_find_custom dzl_tree_find_custom;
alias c_dzl_tree_find_item dzl_tree_find_item;
alias c_dzl_tree_get_context_menu dzl_tree_get_context_menu;
alias c_dzl_tree_get_root dzl_tree_get_root;
alias c_dzl_tree_get_selected dzl_tree_get_selected;
alias c_dzl_tree_get_show_icons dzl_tree_get_show_icons;
alias c_dzl_tree_rebuild dzl_tree_rebuild;
alias c_dzl_tree_remove_builder dzl_tree_remove_builder;
alias c_dzl_tree_scroll_to_node dzl_tree_scroll_to_node;
alias c_dzl_tree_set_context_menu dzl_tree_set_context_menu;
alias c_dzl_tree_set_filter dzl_tree_set_filter;
alias c_dzl_tree_set_root dzl_tree_set_root;
alias c_dzl_tree_set_show_icons dzl_tree_set_show_icons;
alias c_dzl_tree_unselect_all dzl_tree_unselect_all;

// dazzle.TreeBuilder

alias c_dzl_tree_builder_get_type dzl_tree_builder_get_type;
alias c_dzl_tree_builder_new dzl_tree_builder_new;
alias c_dzl_tree_builder_get_tree dzl_tree_builder_get_tree;

// dazzle.TreeNode

alias c_dzl_tree_node_get_type dzl_tree_node_get_type;
alias c_dzl_tree_node_new dzl_tree_node_new;
alias c_dzl_tree_node_add_emblem dzl_tree_node_add_emblem;
alias c_dzl_tree_node_append dzl_tree_node_append;
alias c_dzl_tree_node_clear_emblems dzl_tree_node_clear_emblems;
alias c_dzl_tree_node_collapse dzl_tree_node_collapse;
alias c_dzl_tree_node_expand dzl_tree_node_expand;
alias c_dzl_tree_node_get_area dzl_tree_node_get_area;
alias c_dzl_tree_node_get_children_possible dzl_tree_node_get_children_possible;
alias c_dzl_tree_node_get_expanded dzl_tree_node_get_expanded;
alias c_dzl_tree_node_get_foreground_rgba dzl_tree_node_get_foreground_rgba;
alias c_dzl_tree_node_get_gicon dzl_tree_node_get_gicon;
alias c_dzl_tree_node_get_icon_name dzl_tree_node_get_icon_name;
alias c_dzl_tree_node_get_item dzl_tree_node_get_item;
alias c_dzl_tree_node_get_iter dzl_tree_node_get_iter;
alias c_dzl_tree_node_get_parent dzl_tree_node_get_parent;
alias c_dzl_tree_node_get_path dzl_tree_node_get_path;
alias c_dzl_tree_node_get_reset_on_collapse dzl_tree_node_get_reset_on_collapse;
alias c_dzl_tree_node_get_text dzl_tree_node_get_text;
alias c_dzl_tree_node_get_tree dzl_tree_node_get_tree;
alias c_dzl_tree_node_get_use_dim_label dzl_tree_node_get_use_dim_label;
alias c_dzl_tree_node_get_use_markup dzl_tree_node_get_use_markup;
alias c_dzl_tree_node_has_emblem dzl_tree_node_has_emblem;
alias c_dzl_tree_node_insert dzl_tree_node_insert;
alias c_dzl_tree_node_insert_sorted dzl_tree_node_insert_sorted;
alias c_dzl_tree_node_invalidate dzl_tree_node_invalidate;
alias c_dzl_tree_node_is_root dzl_tree_node_is_root;
alias c_dzl_tree_node_n_children dzl_tree_node_n_children;
alias c_dzl_tree_node_nth_child dzl_tree_node_nth_child;
alias c_dzl_tree_node_prepend dzl_tree_node_prepend;
alias c_dzl_tree_node_rebuild dzl_tree_node_rebuild;
alias c_dzl_tree_node_remove dzl_tree_node_remove;
alias c_dzl_tree_node_remove_emblem dzl_tree_node_remove_emblem;
alias c_dzl_tree_node_select dzl_tree_node_select;
alias c_dzl_tree_node_set_children_possible dzl_tree_node_set_children_possible;
alias c_dzl_tree_node_set_emblems dzl_tree_node_set_emblems;
alias c_dzl_tree_node_set_foreground_rgba dzl_tree_node_set_foreground_rgba;
alias c_dzl_tree_node_set_gicon dzl_tree_node_set_gicon;
alias c_dzl_tree_node_set_icon_name dzl_tree_node_set_icon_name;
alias c_dzl_tree_node_set_item dzl_tree_node_set_item;
alias c_dzl_tree_node_set_reset_on_collapse dzl_tree_node_set_reset_on_collapse;
alias c_dzl_tree_node_set_text dzl_tree_node_set_text;
alias c_dzl_tree_node_set_use_dim_label dzl_tree_node_set_use_dim_label;
alias c_dzl_tree_node_set_use_markup dzl_tree_node_set_use_markup;
alias c_dzl_tree_node_show_popover dzl_tree_node_show_popover;

// dazzle.Trie

alias c_dzl_trie_get_type dzl_trie_get_type;
alias c_dzl_trie_new dzl_trie_new;
alias c_dzl_trie_destroy dzl_trie_destroy;
alias c_dzl_trie_insert dzl_trie_insert;
alias c_dzl_trie_lookup dzl_trie_lookup;
alias c_dzl_trie_ref dzl_trie_ref;
alias c_dzl_trie_remove dzl_trie_remove;
alias c_dzl_trie_traverse dzl_trie_traverse;
alias c_dzl_trie_unref dzl_trie_unref;

// dazzle.WidgetActionGroup

alias c_dzl_widget_action_group_get_type dzl_widget_action_group_get_type;
alias c_dzl_widget_action_group_attach dzl_widget_action_group_attach;
alias c_dzl_widget_action_group_new dzl_widget_action_group_new;
alias c_dzl_widget_action_group_set_action_enabled dzl_widget_action_group_set_action_enabled;
