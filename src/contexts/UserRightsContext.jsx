import { createContext, useContext, useEffect, useState } from 'react';
import { supabase } from '../lib/supabaseClient';
import { useAuth } from './AuthContext';

const UserRightsContext = createContext({});

export const useRights = () => {
  const context = useContext(UserRightsContext);
  if (!context) {
    throw new Error('useRights must be used within UserRightsProvider');
  }
  return context;
};

export function UserRightsProvider({ children }) {
  const { currentUser } = useAuth();
  const [rights, setRights] = useState({});
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (currentUser?.userId) {
      loadUserRights();
    } else {
      setRights({});
      setLoading(false);
    }
  }, [currentUser]);

  const loadUserRights = async () => {
    try {
      const { data, error } = await supabase
        .from('UserModule_Rights')
        .select('Right_ID, Right_value')
        .eq('userid', currentUser.userId)
        .eq('Record_status', 'ACTIVE');

      if (error) throw error;

      // Convert array to object for easy lookup
      const rightsMap = {};
      data.forEach(row => {
        rightsMap[row.Right_ID] = row.Right_value;
      });

      setRights(rightsMap);
      setLoading(false);
    } catch (error) {
      console.error('Error loading user rights:', error);
      setRights({});
      setLoading(false);
    }
  };

  const hasRight = (rightId) => {
    return rights[rightId] === 1;
  };

  const value = {
    rights,
    loading,
    hasRight
  };

  return (
    <UserRightsContext.Provider value={value}>
      {children}
    </UserRightsContext.Provider>
  );
}
