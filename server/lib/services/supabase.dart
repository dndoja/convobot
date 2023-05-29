import 'package:supabase/supabase.dart';

late final SupabaseClient supabase;

void initializeSupabase() => supabase = SupabaseClient('','');
