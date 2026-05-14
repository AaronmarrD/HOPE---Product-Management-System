{/* 
  import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabaseClient';

export default function AuthCallbackPage() {
  const navigate = useNavigate();

  useEffect(() => {
    const handleCallback = async () => {
      const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
        if (event === 'SIGNED_IN' && session) {
          // Check user status
          const { data: userRow } = await supabase
            .from('user')
            .select('record_status')
            .eq('userId', session.user.id)
            .single();

          if (userRow?.record_status === 'ACTIVE') {
            navigate('/products');
          } else {
            await supabase.auth.signOut();
            navigate('/login?error=not_activated');
          }
        }
      });

      return () => subscription.unsubscribe();
    };

    handleCallback();
  }, [navigate]);

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-50">
      <div className="text-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto mb-4"></div>
        <p className="text-gray-600">Signing you in...</p>
      </div>
    </div>
  );
}

*/}

import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabaseClient';

export default function AuthCallbackPage() {
  const navigate = useNavigate();

  useEffect(() => {
    const handleCallback = async () => {
      const {
        data: { session },
        error: sessionError
      } = await supabase.auth.getSession();

      if (sessionError || !session) {
        navigate('/login');
        return;
      }

      const { data: userRow, error: userError } = await supabase
        .from('user')
        .select('record_status')
        .eq('userId', session.user.id)
        .maybeSingle();

      if (userError) {
        console.error('OAuth callback user lookup failed:', userError);
        await supabase.auth.signOut();
        navigate('/login');
        return;
      }

      if (userRow?.record_status === 'ACTIVE') {
        navigate('/products');
      } else {
        await supabase.auth.signOut();
        navigate('/login?error=not_activated');
      }
    };

    handleCallback();
  }, [navigate]);

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-50">
      <div className="text-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto mb-4"></div>
        <p className="text-gray-600">Signing you in...</p>
      </div>
    </div>
  );
}