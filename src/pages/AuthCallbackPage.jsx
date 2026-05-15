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
        .eq('userid', session.user.id)
        .maybeSingle();

      if (userError) {
        console.error('OAuth callback user lookup failed:', userError);
        await supabase.auth.signOut();
        navigate('/login?error=profile_error');
        return;
      }

      if (!userRow) {
        await supabase.auth.signOut();
        navigate('/login?error=profile_missing');
        return;
      }

      if (userRow.record_status === 'ACTIVE') {
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