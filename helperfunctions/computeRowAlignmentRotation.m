        function RrowAlign = computeRowAlignmentRotation(t)

        xUnitVector = [1;0;0];
        if dot(xUnitVector, t) < 0
            xUnitVector = -xUnitVector;
        end

        % find the axis of rotation
        rotationAxis = cross(t,xUnitVector);

        if norm(rotationAxis) == 0 % no rotation
            RrowAlign = eye(3);
        else
            rotationAxis = rotationAxis / norm(rotationAxis);

            % find the angle of rotation
            angle = acos(abs(dot(t,xUnitVector))/(norm(t)*norm(xUnitVector)));

            rotationAxis = angle * rotationAxis;

            % convert the rotation vector into a rotation matrix
            RrowAlign = vision.internal.calibration.rodriguesVectorToMatrix(rotationAxis);
        end
        end